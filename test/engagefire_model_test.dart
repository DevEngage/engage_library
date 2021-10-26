// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:engage_library/main.dart';
import 'package:engage_library/models/test_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.mapper.g.dart' show initializeJsonMapper;

void main() {
  testWidgets('Test the basics of Engagefire doc model',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    initializeJsonMapper();
    await Firebase.initializeApp();
    final test = TestModel();
    test.name = 'test';
    // Verify that our counter starts at 0.
    expect(test.name, 'test');
    expect(test.id, null);
    await test.$save();
    expect(test.id, isNotNull);
    await test.$delete();
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
