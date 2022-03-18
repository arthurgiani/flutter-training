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

  //TODO: Check why forced delays does not work on 'thenThrow'.
  arrangeStringListError() async {
    when(() => listRepositoryMock.getStringList()).thenThrow(Exception());
  }

  Future arrangeLoadedList(WidgetTester tester) async {
    arrangeStringList();
    await tester.pumpWidget(createMainTestWidget());
    await tester.pumpAndSettle();

    final listViewBuilder = find.byKey(const Key('items-list-view-builder'));
    final item0 = find.byKey(const Key('item_0'));
    final item1 = find.byKey(const Key('item_1'));

    expect(listViewBuilder, findsOneWidget);
    expect(item0, findsOneWidget);
    expect(item1, findsOneWidget);
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

    //Since we have a fake delay on arrangeStringList, pumpAndSettle needs to be
    //activated in order to make sure that the test only ends after the last
    //frame build.

    //This is necessary because, even with fake delay on mock method,
    //dart test environment does not consider that delay literally.
    //It means that, inside the test, the '2 seconds delay' does not represent
    //2 seconds delay 'in real life'. Threfore, if we remove pumpAndSettle,
    //further methods will be executed while arrangeStringList is still running.
    //The test will end, the widget tree will be disposed while the 'fake delay'
    //is still happening, so it will cause a Pending Time error.
    await tester.pumpAndSettle();
  });

  testWidgets('display string list after loading', (tester) async {
    await arrangeLoadedList(tester);
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
    await arrangeLoadedList(tester);

    //Add Text
    final textField = find.byType(TextField);
    await tester.enterText(textField, 'item added');

    //Tap FAB and show ProgressIndicator
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();

    //Check if item is added to the list
    expect(find.byKey(const Key('item_2')), findsOneWidget);
  });

  testWidgets(
      'show an error snackbar if user tries to add a forbidden string to string list after press on FAB',
      (tester) async {
    await arrangeLoadedList(tester);

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
