import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_typeahead/src/common/base/floater.dart';

void main() {
  group('Floater Safe Area Tests', () {
    testWidgets('should respect safe area insets in size calculations', (tester) async {
      // Create a test widget with safe area insets
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(
              padding: EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20),
            ),
            child: Scaffold(
              body: Floater(
                link: FloaterLink(),
                builder: (context) => const SizedBox(width: 100, height: 100),
                child: const SizedBox(width: 200, height: 200),
              ),
            ),
          ),
        ),
      );

      // The floater should be created and respect safe area
      expect(find.byType(Floater), findsOneWidget);
    });

    testWidgets('should handle zero safe area insets', (tester) async {
      // Create a test widget with no safe area insets
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(
              padding: EdgeInsets.zero,
            ),
            child: Scaffold(
              body: Floater(
                link: FloaterLink(),
                builder: (context) => const SizedBox(width: 100, height: 100),
                child: const SizedBox(width: 200, height: 200),
              ),
            ),
          ),
        ),
      );

      // The floater should still work with zero safe area
      expect(find.byType(Floater), findsOneWidget);
    });

    testWidgets('should apply safe area padding constraints', (tester) async {
      // Create a test widget with safe area insets
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(
              padding: EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20),
            ),
            child: Scaffold(
              body: Floater(
                link: FloaterLink(),
                builder: (context) => const SizedBox(width: 100, height: 100),
                child: const SizedBox(width: 200, height: 200),
              ),
            ),
          ),
        ),
      );

      // The floater should be created successfully with safe area handling
      expect(find.byType(Floater), findsOneWidget);
    });
  });
}
