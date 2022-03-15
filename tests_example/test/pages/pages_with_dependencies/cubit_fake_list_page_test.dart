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

  arrangeStringList() async {
    when(() => listRepositoryMock.getStringList()).thenAnswer(
      (_) async {
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
  });

  testWidgets(
      'display circular progress indicator when list of strings is loading',
      (tester) async {
    arrangeStringList();
    await tester.pumpWidget(createMainTestWidget());

    final circularProgress = find.byType(CircularProgressIndicator);

    expect(circularProgress, findsOneWidget);
  });

  testWidgets('display string list after loading', (tester) async {
    arrangeStringList();
    await tester.pumpWidget(createMainTestWidget());
    await tester.pump();

    for (String string in strings) {
      expect(find.text(string), findsOneWidget);
    }
  });

  testWidgets(
      'write a text, click on a FAB and add an item to string list after string list is loaded',
      (tester) async {
    arrangeStringList();
    await tester.pumpWidget(createMainTestWidget());
    await tester.pump();

    for (String string in strings) {
      expect(find.text(string), findsOneWidget);
    }

    final textField = find.byType(TextField);
    await tester.enterText(textField, 'item added');

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();

    expect(find.text('item added'), findsOneWidget);
  });

  testWidgets(
      'display error message in case of any error in loading string list',
      (tester) async {
    arrangeStringListError();
    await tester.pumpWidget(createMainTestWidget());
    await tester.pump();

    final errorMessage = find.byKey(const Key('list-error-message'));
    expect(errorMessage, findsOneWidget);
  });
}
