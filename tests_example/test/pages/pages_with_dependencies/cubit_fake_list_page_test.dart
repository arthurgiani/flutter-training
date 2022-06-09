import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tests_example/blocs/list_cubit.dart';
import 'package:tests_example/blocs/list_state.dart';
import 'package:tests_example/pages/pages_with_dependencies/cubit_fake_list_page.dart';

class ListCubitMock extends MockCubit<ListState> implements ListCubit {}

void main() {
  late ListCubitMock listCubitMock;

  setUp(() {
    listCubitMock = ListCubitMock();
  });

  tearDown(() {
    listCubitMock.close();
  });

  Widget createMainTestWidget() {
    return MaterialApp(
      home: BlocProvider<ListCubit>(
        create: (_) => listCubitMock,
        child: const CubitFakeListPage(),
      ),
    );
  }

  final strings = ['String 1', 'String 2'];

  testWidgets('find app bar title ...', (tester) async {
    whenListen(
      listCubitMock,
      Stream.fromIterable(
        [
          ListState(status: ListStatus.loadedList, items: strings),
        ],
      ),
      initialState: ListState(status: ListStatus.initial),
    );

    await tester.pumpWidget(createMainTestWidget());

    final appBarTitle = find.text('Fake List - Cubit');

    expect(appBarTitle, findsOneWidget);
  });

  testWidgets(
      'Should display a CircularProgressIndicator when ListStatus.status is loadingList',
      (tester) async {
    whenListen(
      listCubitMock,
      Stream.fromIterable(
        [
          ListState(status: ListStatus.loadingList),
        ],
      ),
      initialState: ListState(status: ListStatus.loadingList),
    );

    await tester.pumpWidget(createMainTestWidget());

    final circularProgressIndicator = find.byType(CircularProgressIndicator);

    expect(circularProgressIndicator, findsOneWidget);
  });

  testWidgets('Should display a ListView when ListStatus.status is loadedList',
      (tester) async {
    whenListen(
      listCubitMock,
      Stream.fromIterable(
        [
          ListState(status: ListStatus.loadedList, items: strings),
        ],
      ),
      initialState: ListState(status: ListStatus.initial),
    );
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
      'Should display an error message when ListStatus.status is getStringListError',
      (tester) async {
    whenListen(
      listCubitMock,
      Stream.fromIterable(
        [
          ListState(status: ListStatus.getStringListerror),
        ],
      ),
      initialState: ListState(status: ListStatus.getStringListerror),
    );

    await tester.pumpWidget(createMainTestWidget());
    await tester.pumpAndSettle();

    final errorMessage = find.byKey(const Key('list-error-message'));
    expect(errorMessage, findsOneWidget);
  });

  testWidgets(
      'Should show a CircularProgressIndicator as FAB child when ListStatus.status is addingItem',
      (tester) async {
    when(() => listCubitMock.addItem(item: any(named: 'item'))).thenAnswer(
      (_) async => {},
    );

    whenListen(
      listCubitMock,
      Stream.fromIterable(
        [
          ListState(status: ListStatus.addingItem),
        ],
      ),
      initialState: ListState(status: ListStatus.initial),
    );
    await tester.pumpWidget(createMainTestWidget());

    //Add Text
    final textField = find.byType(TextField);
    await tester.enterText(textField, 'item added');

    //Tap FAB and show ProgressIndicator
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    final progress = find.byType(CircularProgressIndicator);
    expect(progress, findsOneWidget);

    verify((() => listCubitMock.addItem(item: 'item added'))).called(1);
  });

  testWidgets(
      '''Should raise a SnackBar when ListStatus.status is addItemError and
        check that the forbidden item was not added to the list.''',
      (tester) async {
    when(() => listCubitMock.addItem(item: any(named: 'item'))).thenAnswer(
      (_) async => {},
    );

    whenListen(
      listCubitMock,
      Stream.fromIterable(
        [
          ListState(status: ListStatus.addItemError),
        ],
      ),
      initialState: ListState(status: ListStatus.initial),
    );

    await tester.pumpWidget(createMainTestWidget());

    //Add forbidden Text
    final textField = find.byType(TextField);
    await tester.enterText(textField, 'forbidden item');

    //Tap FAB
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    //Check if snackbar appears and if item0 is not added to the list
    expect(find.byKey(const Key('item_0')), findsNothing);
    expect(find.byType(SnackBar), findsOneWidget);

    verify((() => listCubitMock.addItem(item: 'forbidden item'))).called(1);
  });
}
