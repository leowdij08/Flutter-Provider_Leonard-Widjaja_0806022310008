import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ephermal_state_codelab/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyEphemeralApp());

    // Verify that the counter starts at 0.
    expect(find.text('Counter Value: 0'), findsOneWidget);
    expect(find.text('Counter Value: 1'), findsNothing);

    // Tap the 'Increment' button and trigger a frame.
    await tester.tap(find.text('Increment'));
    await tester.pump();

    // Verify that the counter has incremented.
    expect(find.text('Counter Value: 0'), findsNothing);
    expect(find.text('Counter Value: 1'), findsOneWidget);
  });
}
