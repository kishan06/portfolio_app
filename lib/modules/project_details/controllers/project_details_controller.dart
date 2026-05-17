import 'package:get/get.dart';
import 'package:portfolio_app/data/models/project_model.dart';

class ProjectDetailsController extends GetxController {
  late final ProjectModel project;

  @override
  void onInit() {
    super.onInit();
    // Retrieve the project model passed via arguments
    project = Get.arguments as ProjectModel;
  }
}
