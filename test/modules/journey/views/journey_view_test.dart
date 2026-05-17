import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/modules/journey/controllers/journey_controller.dart';
import 'package:portfolio_app/modules/journey/views/journey_view.dart';
import 'package:portfolio_app/modules/journey/widgets/timeline_item.dart';
import 'package:portfolio_app/core/widgets/nav_bar.dart';
import 'package:portfolio_app/core/widgets/footer.dart';

void main() {
  setUp(() {
    Get.put(JourneyController());
  });

  tearDown(() {
    Get.delete<JourneyController>();
  });

  testWidgets('JourneyView displays NavBar, Footer and TimelineItems', (WidgetTester tester) async {
    await tester.runAsync(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const GetMaterialApp(
        home: JourneyView(),
      ));

      // Wait for initial animations
      await tester.pump();

      // Verify NavBar is present
      expect(find.byType(NavBar), findsOneWidget);

      // Verify header text is present
      expect(find.text('Career Journey'), findsOneWidget);

      // Verify TimelineItems are present (based on StaticData.experience length which is 3)
      expect(find.byType(TimelineItem), findsNWidgets(3));

      // Verify Footer is present
      expect(find.byType(Footer), findsOneWidget);
    });
  });
}
