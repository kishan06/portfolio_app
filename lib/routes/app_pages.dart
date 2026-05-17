import 'package:get/get.dart';
import 'package:portfolio_app/routes/app_routes.dart';
import 'package:portfolio_app/modules/landing/views/landing_view.dart';
import 'package:portfolio_app/modules/landing/controllers/landing_controller.dart';
import 'package:portfolio_app/modules/work/views/work_view.dart';
import 'package:portfolio_app/modules/work/controllers/work_controller.dart';
import 'package:portfolio_app/modules/journey/views/journey_view.dart';
import 'package:portfolio_app/modules/journey/controllers/journey_controller.dart';

import 'package:portfolio_app/modules/project_details/views/project_details_view.dart';
import 'package:portfolio_app/modules/project_details/controllers/project_details_controller.dart';

class AppPages {
  static const INITIAL = Routes.LANDING;

  static final routes = [
    GetPage(
      name: Routes.LANDING,
      page: () => const LandingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LandingController());
      }),
    ),
    GetPage(
      name: Routes.WORK,
      page: () => const WorkView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => WorkController());
      }),
    ),
    GetPage(
      name: Routes.JOURNEY,
      page: () => const JourneyView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => JourneyController());
      }),
    ),
    GetPage(
      name: Routes.PROJECT_DETAILS,
      page: () => const ProjectDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ProjectDetailsController());
      }),
    ),
  ];
}
