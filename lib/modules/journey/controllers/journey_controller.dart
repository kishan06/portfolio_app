import 'package:get/get.dart';
import 'package:portfolio_app/data/local_data/static_data.dart';
import 'package:portfolio_app/data/models/experience_model.dart';

class JourneyController extends GetxController {
  final experience = <ExperienceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadExperience();
  }

  void loadExperience() {
    experience.value = StaticData.experience;
  }
}
