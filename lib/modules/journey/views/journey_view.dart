import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/core/theme/app_theme.dart';
import 'package:portfolio_app/core/widgets/nav_bar.dart';
import 'package:portfolio_app/modules/journey/controllers/journey_controller.dart';
import 'package:portfolio_app/modules/journey/widgets/timeline_item.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_app/core/widgets/footer.dart';

class JourneyView extends GetView<JourneyController> {
  const JourneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 800,
                ), // Max width for readability
                child: Column(
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 60),
                    _buildTimeline(),
                    const SizedBox(height: 80),
                    const Footer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "Career Journey",
          style: AppTextStyles.displayMedium.copyWith(fontSize: 32),
        ).animate().fadeIn().slideY(begin: -0.5, end: 0),
        const SizedBox(height: 16),
        Container(
          height: 4,
          width: 80,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
        ).animate().scaleX(duration: 600.ms),
      ],
    );
  }

  Widget _buildTimeline() {
    return Obx(() {
      final experienceList = controller.experience;
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: experienceList.length,
        itemBuilder: (context, index) {
          return TimelineItem(
                experience: experienceList[index],
                isLast: index == experienceList.length - 1,
                isLeftAligned: index % 2 == 0,
              )
              .animate()
              .fadeIn(delay: (200 * index).ms)
              .slideY(begin: 0.2, end: 0);
        },
      );
    });
  }
}
