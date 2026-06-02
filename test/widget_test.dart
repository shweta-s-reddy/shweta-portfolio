// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shweta_portfolio/app/app.dart';

void main() {
  testWidgets('Theme toggle and landing experience smoke test', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title text exists
    expect(find.text('Welcome to My Portfolio'), findsOneWidget);

    // Verify default theme is dark mode, so we show the light_mode icon to switch to light mode
    expect(find.byIcon(Icons.light_mode), findsOneWidget);
    expect(find.byIcon(Icons.dark_mode), findsNothing);

    // Tap the theme toggle button and trigger a frame.
    await tester.tap(find.byTooltip('Toggle Theme'));
    await tester.pump();
    // Use pumpAndSettle to wait for all transitions (AnimatedSwitcher & EntranceAnimations) to settle
    await tester.pumpAndSettle();

    // Verify that the theme toggled to light mode, and icon updated to dark_mode
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
    expect(find.byIcon(Icons.light_mode), findsNothing);
  });
}
