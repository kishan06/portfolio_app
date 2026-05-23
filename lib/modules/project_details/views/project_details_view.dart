import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_app/core/theme/app_theme.dart';
import 'package:portfolio_app/core/utils/responsive.dart';
import 'package:portfolio_app/core/widgets/nav_bar.dart';
import 'package:portfolio_app/core/widgets/footer.dart';
import 'package:portfolio_app/modules/project_details/controllers/project_details_controller.dart';
import 'package:portfolio_app/modules/project_details/widgets/project_link_button.dart';
import 'package:portfolio_app/modules/project_details/widgets/project_image_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectDetailsView extends GetView<ProjectDetailsController> {
  const ProjectDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 20 : 100,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackButton(),
                  const SizedBox(height: 30),
                  _buildHeroSection(context),
                  const SizedBox(height: 50),
                  _buildProjectLinks(),
                  const SizedBox(height: 50),
                  Responsive.isMobile(context)
                      ? _buildMobileLayout()
                      : _buildDesktopLayout(),
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

  Widget _buildBackButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primary,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              "Back to Work",
              style: GoogleFonts.inter(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.2);
  }

  Widget _buildHeroSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Type Badge
        if (controller.project.projectType != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary.withOpacity(0.5)),
            ),
            child: Text(
              controller.project.projectType!.toUpperCase(),
              style: GoogleFonts.inter(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1.5,
              ),
            ),
          ).animate().fadeIn().slideY(begin: 0.3),
        const SizedBox(height: 20),
        // Title
        Text(
          controller.project.title,
          style: AppTextStyles.headline.copyWith(
            fontSize: Responsive.isMobile(context) ? 40 : 64,
            height: 1.1,
          ),
        ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.3),
        const SizedBox(height: 20),
        // Meta Info
        Wrap(
          spacing: 20,
          runSpacing: 10,
          children: [
            if (controller.project.company != null)
              _buildMetaItem(Icons.business, controller.project.company!),
            if (controller.project.role != null)
              _buildMetaItem(Icons.person_outline, controller.project.role!),
            if (controller.project.duration != null)
              _buildMetaItem(
                Icons.calendar_today,
                controller.project.duration!,
              ),
          ],
        ).animate().fadeIn(delay: 200.ms),
        const SizedBox(height: 40),
        // Image or Carousel
        if (controller.project.gallery != null &&
            controller.project.gallery!.isNotEmpty)
          ProjectImageCarousel(imageUrls: controller.project.gallery!)
        else
          Hero(
                tag: controller.project.title,
                child: Container(
                  height: Responsive.isMobile(context) ? 250 : 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 40,
                        spreadRadius: -10,
                      ),
                    ],
                    image: DecorationImage(
                      image: controller.project.imageUrl.startsWith('http')
                          ? NetworkImage(controller.project.imageUrl) as ImageProvider
                          : AssetImage(controller.project.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(delay: 300.ms)
              .scale(begin: const Offset(0.95, 0.95)),
      ],
    );
  }

  Widget _buildMetaItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.textDim, size: 18),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.inter(
            color: AppColors.textDim,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildProjectLinks() {
    bool hasLinks =
        controller.project.websiteUrl != null ||
        controller.project.playStoreUrl != null ||
        controller.project.appStoreUrl != null;

    if (!hasLinks) return const SizedBox.shrink();

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        ProjectLinkButton(
          url: controller.project.websiteUrl,
          icon: const Icon(Icons.language),
          label: "Live Demo",
        ),
        ProjectLinkButton(
          url: controller.project.playStoreUrl,
          icon: const FaIcon(FontAwesomeIcons.googlePlay),
          label: "Play Store",
        ),
        ProjectLinkButton(
          url: controller.project.appStoreUrl,
          icon: const FaIcon(FontAwesomeIcons.apple),
          label: "App Store",
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildOverviewSection(),
        const SizedBox(height: 30),
        _buildContributionsSection(),
        const SizedBox(height: 30),
        _buildCoreFeaturesSection(),
        const SizedBox(height: 30),
        _buildTechStackSection(),
        const SizedBox(height: 30),
        _buildImpactSection(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOverviewSection(),
              const SizedBox(height: 40),
              _buildCoreFeaturesSection(),
              const SizedBox(height: 40),
              _buildContributionsSection(),
            ],
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTechStackSection(),
              const SizedBox(height: 40),
              _buildImpactSection(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGlassCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.glass,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.inter(
                  color: AppColors.textLight,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1);
  }

  Widget _buildOverviewSection() {
    return _buildGlassCard(
      title: "Overview",
      child: Text(
        controller.project.description,
        style: AppTextStyles.bodyMedium.copyWith(fontSize: 16, height: 1.8),
      ),
    );
  }

  Widget _buildContributionsSection() {
    if (controller.project.contributions == null ||
        controller.project.contributions!.isEmpty) {
      return const SizedBox.shrink();
    }
    return _buildGlassCard(
      title: "Key Contributions",
      child: Column(
        children: controller.project.contributions!
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Icon(
                        Icons.check_circle,
                        color: AppColors.primary,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildCoreFeaturesSection() {
    if (controller.project.coreFeatures == null ||
        controller.project.coreFeatures!.isEmpty) {
      return const SizedBox.shrink();
    }
    return _buildGlassCard(
      title: "Core Features",
      child: Column(
        children: controller.project.coreFeatures!
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Icon(
                        Icons.star,
                        color: AppColors.primary,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildTechStackSection() {
    return _buildGlassCard(
      title: "Tech Stack",
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: controller.project.techStack.map((tech) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Text(
              tech,
              style: GoogleFonts.inter(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildImpactSection() {
    if (controller.project.impactMetrics == null ||
        controller.project.impactMetrics!.isEmpty) {
      return const SizedBox.shrink();
    }
    return _buildGlassCard(
      title: "Impact & Metrics",
      child: Column(
        children: controller.project.impactMetrics!
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.insights,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        item,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 16,
                          color: AppColors.textLight,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
