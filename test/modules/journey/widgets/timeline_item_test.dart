import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_app/data/models/experience_model.dart';
import 'package:portfolio_app/modules/journey/widgets/timeline_item.dart';

void main() {
  testWidgets('TimelineItem displays experience data correctly', (WidgetTester tester) async {
    await tester.runAsync(() async {
      final experience = ExperienceModel(
        role: 'Test Role',
        company: 'Test Company',
        period: '2023 - 2024',
        description: 'Test Description',
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TimelineItem(
            experience: experience,
            isLast: false,
            isLeftAligned: true,
          ),
        ),
      ));

      await tester.pump();

      expect(find.text('Test Role'), findsOneWidget);
      expect(find.text('Test Company'), findsOneWidget);
      expect(find.text('2023 - 2024'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });
  });
}
