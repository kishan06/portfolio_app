import 'package:get/get.dart';

import 'package:portfolio_app/data/local_data/static_data.dart';
import 'package:portfolio_app/data/models/experience_model.dart';
import 'package:portfolio_app/data/models/project_model.dart';

class LandingController extends GetxController {
  final projects = <ProjectModel>[].obs;
  final experience = <ExperienceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() {
    projects.value = StaticData.projects;
    experience.value = StaticData.experience;
  }
}
