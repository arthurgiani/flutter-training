import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tests_example/blocs/list_cubit.dart';
import 'package:tests_example/pages/pages_with_dependencies/cubit_fake_list_page.dart';
import 'package:tests_example/repositories/list_repository.dart';

class ListRepositoryMock extends Mock implements ListRepository {}

void main() {
  late ListRepository listRepositoryMock;

  setUp(() {
    listRepositoryMock = ListRepositoryMock();
  });

  final strings = ['String 1', 'String 2'];

  Widget createMainTestWidget() {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ListCubit(
          listRepository: listRepositoryMock,
        ),
        child: const CubitFakeListPage(),
      ),
    );
  }

  arrangeStringList() {
    when(() => listRepositoryMock.getStringList()).thenAnswer(
      (_) async {
        await Future.delayed(const Duration(seconds: 1));
        return strings;
      },
    );
  }

  arrangeStringListError() async {
    when(() => listRepositoryMock.getStringList()).thenThrow(Exception());
  }

  testWidgets('find app bar title ...', (tester) async {
    arrangeStringList();
    await tester.pumpWidget(createMainTestWidget());

    final appBarTitle = find.text('Fake List - Cubit');

    expect(appBarTitle, findsOneWidget);
    await tester.pumpAndSettle();
  });

  testWidgets(
      'display circular progress indicator when list of strings is loading when build method runs',
      (tester) async {
    arrangeStringList();
    await tester.pumpWidget(createMainTestWidget());

    final circularProgress = find.byType(CircularProgressIndicator);

    expect(circularProgress, findsOneWidget);
    await tester.pumpAndSettle();
  });

  testWidgets('display string list after loading', (tester) async {
    arrangeStringList();
    await tester.pumpWidget(createMainTestWidget());
    await tester.pumpAndSettle();

    final listViewBuilder = find.byKey(const Key('items-list-view-builder'));
    final item0 = find.byKey(const Key('item_0'));
    final item1 = find.byKey(const Key('item_1'));

    expect(listViewBuilder, findsOneWidget);
    expect(item0, findsOneWidget);
    expect(item1, findsOneWidget);
  });

  testWidgets(
      'display error message in case of any error in loading string list',
      (tester) async {
    arrangeStringListError();
    await tester.pumpWidget(createMainTestWidget());

    final errorMessage = find.byKey(const Key('list-error-message'));
    expect(errorMessage, findsOneWidget);
  });

  testWidgets(
      'Check if a string from TextField can be added to a loaded string list after press on FAB',
      (tester) async {
    arrangeStringList();
    await tester.pumpWidget(createMainTestWidget());
    await tester.pumpAndSettle();

    //Initial list loaded
    final listViewBuilder = find.byKey(const Key('items-list-view-builder'));
    final item0 = find.byKey(const Key('item_0'));
    final item1 = find.byKey(const Key('item_1'));
    expect(listViewBuilder, findsOneWidget);
    expect(item0, findsOneWidget);
    expect(item1, findsOneWidget);

    //Add Text
    final textField = find.byType(TextField);
    await tester.enterText(textField, 'item added');

    //Tap FAB and show ProgressIndicator
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();

    //Check if item is added to the list
    expect(find.text('item added'), findsOneWidget);
  });

  testWidgets(
      'show an error snackbar if user tries to add a forbidden string to string list after press on FAB',
      (tester) async {
    arrangeStringList();
    await tester.pumpWidget(createMainTestWidget());
    await tester.pumpAndSettle();

    //Initial list loaded
    final listViewBuilder = find.byKey(const Key('items-list-view-builder'));
    final item0 = find.byKey(const Key('item_0'));
    final item1 = find.byKey(const Key('item_1'));
    expect(listViewBuilder, findsOneWidget);
    expect(item0, findsOneWidget);
    expect(item1, findsOneWidget);

    //Add forbidden Text
    final textField = find.byType(TextField);
    await tester.enterText(textField, 'forbidden item');

    //Tap FAB
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    //Check if snackbar appears and if item2 is not added to the list
    expect(find.byKey(const Key('item_2')), findsNothing);
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
