import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio_app/core/theme/app_theme.dart';
import 'package:portfolio_app/core/utils/responsive.dart';
import 'package:portfolio_app/core/widgets/nav_bar.dart';
import 'package:portfolio_app/modules/landing/controllers/landing_controller.dart';
import 'package:portfolio_app/core/widgets/social_icon.dart';
import 'package:portfolio_app/core/widgets/footer.dart';
import 'package:portfolio_app/routes/app_routes.dart';
import 'package:portfolio_app/modules/work/widgets/project_card.dart';
import 'package:portfolio_app/modules/journey/widgets/timeline_item.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 40,
                    ),
                    child: Responsive(
                      mobile: _buildMobileHero(),
                      desktop: _buildDesktopHero(),
                    ),
                  ),
                  _buildWorkSection(context),
                  _buildJourneySection(),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopHero() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: _buildTextSection(textAlign: TextAlign.left),
            ),
            const SizedBox(width: 40),
            Expanded(flex: 5, child: _buildKeyExpertiseCard()),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileHero() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTextSection(textAlign: TextAlign.center),
        const SizedBox(height: 40),
        _buildKeyExpertiseCard(),
      ],
    );
  }

  Widget _buildTextSection({required TextAlign textAlign}) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Open for Opportunities Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .fadeIn(duration: 600.ms)
                  .fadeOut(delay: 600.ms),
              const SizedBox(width: 8),
              Text(
                "Open for Opportunities",
                style: GoogleFonts.inter(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ).animate().fadeIn().slideY(begin: -0.2, end: 0),
        const SizedBox(height: 24),

        RichText(
          textAlign: textAlign,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Crafting Seamless\n",
                style: AppTextStyles.displayLarge.copyWith(height: 1.2),
              ),
              TextSpan(
                text: "Mobile Experiences",
                style: AppTextStyles.displayLarge.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(),

        const SizedBox(height: 24),

        Text(
          "Senior Flutter Developer specializing in high-performance iOS & Android applications. I transform complex requirements into buttery smooth 60fps interfaces.",
          style: AppTextStyles.bodyLarge,
          textAlign: textAlign,
        ).animate().fadeIn(delay: 400.ms),

        const SizedBox(height: 32),

        Row(
          mainAxisAlignment: textAlign == TextAlign.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            SocialIcon(icon: Icons.code, url: "#"), // GitHub placeholder
            SizedBox(width: 16),
            SocialIcon(icon: Icons.person, url: "#"), // LinkedIn placeholder
            SizedBox(width: 16),
            SocialIcon(icon: Icons.email, url: "#"), // Email placeholder
          ],
        ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildWorkSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
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
          const SizedBox(height: 60),
          Center(
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
                    if (projects.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    // Show top 3 or all if less than 3
                    final displayProjects = projects.take(3).toList();

                    return Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 32,
                                mainAxisSpacing: 32,
                                childAspectRatio: 0.8,
                              ),
                          itemCount: displayProjects.length,
                          itemBuilder: (context, index) {
                            return ProjectCard(project: displayProjects[index])
                                .animate()
                                .fadeIn(delay: (100 * index).ms)
                                .slideY(begin: 0.2, end: 0);
                          },
                        ),
                        const SizedBox(height: 40),
                        OutlinedButton(
                          onPressed: () => Get.toNamed(Routes.WORK),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.primary),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "View All Projects",
                            style: GoogleFonts.inter(
                              color: AppColors.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ).animate().fadeIn(delay: 500.ms),
                      ],
                    );
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJourneySection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
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
          const SizedBox(height: 60),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Obx(() {
              final experienceList = controller.experience;
              // Show top 3 experiences (or all if user wants full journey, prompt said "as well as journey")
              // Prompt said "I want all content of work section as well as journey"
              // but later said "landing page must also show atleast 3-4 projects".
              // Implicitly for Journey, usually we show full or latest. Let's show all for now as "Career Journey" implies timeline.
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
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyExpertiseCard() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.glass,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and Title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                ),
                child: const Icon(Icons.terminal, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Key Expertise",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 2,
                    width: 48,
                    color: AppColors.primary.withOpacity(0.4),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // List Items
          _buildExpertiseItem(
            Icons.trending_up,
            "Fintech & Real-Time Systems",
            "Developed trading platforms with broker integrations, live market signals, portfolio tracking, KYC flows, and secure payment systems.",
          ),
          const SizedBox(height: 16),
          _buildExpertiseItem(
            Icons.language,
            "Full-Stack & Integrations",
            "Worked across Flutter + Laravel backend systems with REST/SOAP APIs, Firebase, WebSockets, Google Maps, and third-party SDK integrations.",
          ),
          const SizedBox(height: 16),
          _buildExpertiseItem(
            Icons.groups,
            "Leadership & Product Delivery",
            "Led teams of 7+ developers, managed sprint planning, code reviews, production releases, and cross-functional collaboration.",
          ),

          const SizedBox(height: 24),
          Divider(color: Colors.grey.withOpacity(0.2)),
          const SizedBox(height: 16),

          // Current Focus
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.navy.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "// Current Focus",
                  style: GoogleFonts.firaCode(
                    fontSize: 12,
                    color: AppColors.textDim,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Engineering production-ready Flutter systems focused on performance, scalability, and real-world business impact.",
                  style: AppTextStyles.bodyMedium.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.2, end: 0);
  }

  Widget _buildExpertiseItem(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.firaCode(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 14,
                  color: AppColors.textDim,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
