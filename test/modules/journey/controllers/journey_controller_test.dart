import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_app/modules/journey/controllers/journey_controller.dart';
import 'package:portfolio_app/data/local_data/static_data.dart';

void main() {
  late JourneyController controller;

  setUp(() {
    controller = JourneyController();
    controller.onInit(); // simulate GetX lifecycle
  });

  test('JourneyController loads experience data on init', () {
    expect(controller.experience.length, StaticData.experience.length);
    expect(controller.experience.first.role, StaticData.experience.first.role);
  });
}
