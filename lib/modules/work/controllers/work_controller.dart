import 'package:get/get.dart';
import 'package:portfolio_app/data/local_data/static_data.dart';
import 'package:portfolio_app/data/models/project_model.dart';

class WorkController extends GetxController {
  final projects = <ProjectModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProjects();
  }

  void loadProjects() {
    // Simulate loading or fetch from API
    projects.value = StaticData.projects;
  }
}
