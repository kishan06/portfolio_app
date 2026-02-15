import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/core/theme/app_theme.dart';
import 'package:portfolio_app/core/widgets/nav_bar.dart';
import 'package:portfolio_app/modules/work/controllers/work_controller.dart';
import 'package:portfolio_app/modules/work/widgets/project_card.dart';
import 'package:portfolio_app/core/utils/responsive.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_app/core/widgets/footer.dart';

class WorkView extends GetView<WorkController> {
  const WorkView({Key? key}) : super(key: key);

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
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 60),
                  _buildProjectGrid(context),
                  const SizedBox(height: 80),
                  const Footer(),
                ],
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
          "Featured Projects",
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
        const SizedBox(height: 24),
        Text(
          "Selected mobile applications demonstrating clean architecture and pixel-perfect implementation.",
          style: AppTextStyles.bodyLarge,
          textAlign: TextAlign.center,
        ).animate().fadeIn(delay: 200.ms),
      ],
    );
  }

  Widget _buildProjectGrid(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 3;
            if (constraints.maxWidth < 850) {
              crossAxisCount = 1;
            } else if (constraints.maxWidth < 1100) {
              crossAxisCount = 2;
            }

            return Obx(() {
              final projects = controller.projects;
              // Standard GridView isn't great for responsiveness with fixed aspect ratios sometimes,
              // but we can try childAspectRatio or use Wrap for better flow if needed.
              // GridView.builder is generally fine.
              if (projects.isEmpty) {
                return const Center(
                  child: Text(
                    "No projects found",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: 0.8, // Adjust based on card content
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: projects[index])
                      .animate()
                      .fadeIn(delay: (100 * index).ms)
                      .slideY(begin: 0.2, end: 0);
                },
              );
            });
          },
        ),
      ),
    );
  }
}
