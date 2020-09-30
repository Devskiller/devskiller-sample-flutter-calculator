import 'package:calculator_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('shouldClearLatestDigitWhenBackIsPressed', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);

    await tester.tap(find.byKey(ValueKey('1')));
    await tester.tap(find.byKey(ValueKey('2')));
    await tester.tap(find.byKey(ValueKey('3')));
    await tester.tap(find.byKey(ValueKey('<-')));

    await tester.pump();

    expect(find.text('12'), findsOneWidget);
  });

  testWidgets('shouldAdd', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);

    await tester.tap(find.byKey(ValueKey('6')));
    await tester.tap(find.byKey(ValueKey('+')));
    await tester.tap(find.byKey(ValueKey('7')));
    await tester.tap(find.byKey(ValueKey('=')));

    await tester.pump();

    expect(find.text('13'), findsOneWidget);
  });

  testWidgets('shouldSubtract', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);

    await tester.tap(find.byKey(ValueKey('6')));
    await tester.tap(find.byKey(ValueKey('-')));
    await tester.tap(find.byKey(ValueKey('7')));
    await tester.tap(find.byKey(ValueKey('=')));

    await tester.pump();

    expect(find.text('-1'), findsOneWidget);
  });

  testWidgets('shouldMultiply', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('5'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);

    await tester.tap(find.byKey(ValueKey('5')));
    await tester.tap(find.byKey(ValueKey('x')));
    await tester.tap(find.byKey(ValueKey('4')));
    await tester.tap(find.byKey(ValueKey('=')));

    await tester.pump();

    expect(find.text('20'), findsOneWidget);
  });

  testWidgets('shouldDivide', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('8'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);

    await tester.tap(find.byKey(ValueKey('8')));
    await tester.tap(find.byKey(ValueKey('÷')));
    await tester.tap(find.byKey(ValueKey('4')));
    await tester.tap(find.byKey(ValueKey('=')));

    await tester.pump();

    expect(find.text('2'), findsNWidgets(2));
  });

  testWidgets('shouldReportErrorWhenDivideByZero', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('9'), findsOneWidget);
    expect(find.text('0'), findsNWidgets(2));

    await tester.tap(find.byKey(ValueKey('9')));
    await tester.tap(find.byKey(ValueKey('÷')));
    await tester.tap(find.byKey(ValueKey('0')));
    await tester.tap(find.byKey(ValueKey('=')));

    await tester.pump();

    expect(find.text('E'), findsOneWidget);
  });

  testWidgets('shouldClearScreenWhenCEIsPressed', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('4'), findsOneWidget);

    await tester.tap(find.byKey(ValueKey('4')));
    await tester.tap(find.byKey(ValueKey('4')));

    await tester.tap(find.byKey(ValueKey('CE')));

    await tester.pump();

    expect(find.text('0'), findsNWidgets(2));
  });


}
