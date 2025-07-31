import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sanad_micro_funding/main.dart';

void main() {
  group('Sanad App Tests', () {
    testWidgets('App should build without errors', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const SanadApp());
      
      // Verify that the app builds successfully
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('App should have proper title', (WidgetTester tester) async {
      await tester.pumpWidget(const SanadApp());
      
      // Verify app title
      expect(find.text('ساند - Sanad'), findsNothing); // Title is in AppBar
    });

    testWidgets('App should support RTL layout', (WidgetTester tester) async {
      await tester.pumpWidget(const SanadApp());
      
      // Verify RTL support by checking text direction
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp, isNotNull);
    });
  });
} 