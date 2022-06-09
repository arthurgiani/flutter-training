import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tests_example/blocs/list_cubit.dart';
import 'package:tests_example/pages/pages_with_dependencies/cubit_fake_list_page.dart';
import 'package:tests_example/repositories/list_repository.dart';

class ListRepositoryMock extends Mock implements ListRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late ListRepository listRepositoryMock;

  setUp(() {
    listRepositoryMock = ListRepositoryMock();
  });

  Widget createMainTestWidget() {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ListCubit(
          listRepository: listRepositoryMock,
        )..getStringList(),
        child: const CubitFakeListPage(),
      ),
    );
  }

  final strings = ['String 1', 'String 2'];

  //Dart test zone works different than the 'real' production zone.
  //Test environment does not consider the fake 2 seconds delay in
  //getStringList(), so we need to force another delay in 'thenAnswer'
  arrangeStringList() {
    when(() => listRepositoryMock.getStringList()).thenAnswer(
      (_) async {
        await Future.delayed(const Duration(seconds: 1));
        return strings;
      },
    );
  }

  arrangeStringListError() async {
    when(() => listRepositoryMock.getStringList()).thenAnswer((_) async {
      await Future.delayed(const Duration(seconds: 1));
      throw Exception();
    });
  }

  testWidgets(
    '''
      Workflow 1 - Error on loading list
      1) Show CircularProgressIndicator while list is loading
      2) Show error message
    ''',
    (tester) async {
      arrangeStringListError();

      await tester.pumpWidget(createMainTestWidget());

      // Step 1
      final circularProgressIndicator = find.byType(CircularProgressIndicator);
      expect(circularProgressIndicator, findsOneWidget);

      await tester.pumpAndSettle();

      final errorMessage = find.byKey(const Key('list-error-message'));
      expect(errorMessage, findsOneWidget);
    },
  );

  testWidgets(
    '''
      Workflow 2 - Load list + Add Item 
      1) Show CircularProgressIndicator while list is loading
      2) Load List with mock data
      3) Type extra item on text field
      4) Tap FAB
      5) Show CircularProgressIndicator on FAB
      6) Show new item on the list
    ''',
    (tester) async {
      arrangeStringList();

      await tester.pumpWidget(createMainTestWidget());

      // Step 1
      final circularProgressIndicator = find.byType(CircularProgressIndicator);
      expect(circularProgressIndicator, findsOneWidget);

      await tester.pumpAndSettle();

      // Step 2
      final listViewBuilder = find.byKey(const Key('items-list-view-builder'));
      final item0 = find.byKey(const Key('item_0'));
      final item1 = find.byKey(const Key('item_1'));

      expect(listViewBuilder, findsOneWidget);
      expect(item0, findsOneWidget);
      expect(item1, findsOneWidget);

      // Step 3
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'third item');

      // Step 4
      final fab = find.byType(FloatingActionButton);
      await tester.tap(fab);

      await tester.pump();

      // Step 5
      final circularProgressIndicator2 = find.byType(CircularProgressIndicator);
      expect(circularProgressIndicator2, findsOneWidget);

      await tester.pumpAndSettle();

      // Step 6
      expect(find.byKey(const Key('item_2')), findsOneWidget);
    },
  );

  testWidgets(
    '''
      Workflow 3 - Load List + Add Item error
      1) Show CircularProgressIndicator while list is loading
      2) Load List with mock data
      3) Type forbidden text on text field
      4) Tap FAB
      5) Show SnackBar indication that the user typed a forbidden text
      6) Assure that the forbidden item was not added into the list
    ''',
    (tester) async {
      arrangeStringList();

      await tester.pumpWidget(createMainTestWidget());

      // Step 1
      final circularProgressIndicator = find.byType(CircularProgressIndicator);
      expect(circularProgressIndicator, findsOneWidget);

      await tester.pumpAndSettle();

      // Step 2
      final listViewBuilder = find.byKey(const Key('items-list-view-builder'));
      final item0 = find.byKey(const Key('item_0'));
      final item1 = find.byKey(const Key('item_1'));

      expect(listViewBuilder, findsOneWidget);
      expect(item0, findsOneWidget);
      expect(item1, findsOneWidget);

      // Step 3
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'forbidden item');

      // Step 4
      final fab = find.byType(FloatingActionButton);
      await tester.tap(fab);

      await tester.pump();

      // Step 5
      final circularProgressIndicator2 = find.byType(SnackBar);
      expect(circularProgressIndicator2, findsOneWidget);

      // Step 6
      expect(find.byKey(const Key('item_2')), findsNothing);
    },
  );
}
