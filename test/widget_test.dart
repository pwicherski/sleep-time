// This is a basic Flutter widget test.
// Run with flutter test test/widget_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:first_app/main.dart';

void main() {
  testWidgets('Main widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.text('Find out when to get up if you go to bed right now'), findsOneWidget);
    expect(find.text('If you head up'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.text('zZz'));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Refresh zZz'), findsOneWidget);
    expect(find.text('If you head to bed right now, you should try to wake up at one of the following times\u{00B9}:'), findsOneWidget);
  });
}
