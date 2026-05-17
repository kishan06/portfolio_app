import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/theme/app_theme.dart';
import 'package:portfolio_app/data/models/experience_model.dart';
import 'package:portfolio_app/core/utils/responsive.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TimelineItem extends StatelessWidget {
  final ExperienceModel experience;
  final bool isLast;
  final bool isLeftAligned;

  const TimelineItem({
    Key? key,
    required this.experience,
    required this.isLast,
    required this.isLeftAligned,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    return Stack(
      children: [
        // Timeline Line
        if (!isLast)
          Positioned(
            top: 20,
            bottom: 0,
            left: isMobile ? 19 : 0,
            right: isMobile ? null : 0,
            child: Align(
              alignment: isMobile ? Alignment.topLeft : Alignment.topCenter,
              child: Container(
                width: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary,
                      AppColors.primary.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
            ),
          ),
        // Content Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Side (Date for Desktop, empty for Mobile if not careful, but let's follow design)
            // Design: Mobile usually has everything on one side. Desktop zig-zags.
            if (!isMobile)
              Expanded(
                child: isLeftAligned
                    ? _buildContent(context, alignRight: true)
                    : _buildDate(alignRight: true),
              ),

            // Timeline Node
            SizedBox(
              width: 40,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                      ), // Align with text top
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundDark,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )
                    .animate(onPlay: (controller) => controller.repeat())
                    .scale(
                      duration: 2000.ms,
                      begin: const Offset(1, 1),
                      end: const Offset(1.2, 1.2),
                      curve: Curves.easeInOut,
                    )
                    .then()
                    .scale(
                      duration: 2000.ms,
                      begin: const Offset(1.2, 1.2),
                      end: const Offset(1, 1),
                      curve: Curves.easeInOut,
                    ),
              ),
            ),

            // Right Side
            Expanded(
              child: isMobile
                  ? _buildContent(
                      context,
                      alignRight: false,
                    ) // Mobile always content on right (or left of line)
                  : isLeftAligned
                  ? _buildDate(alignRight: false)
                  : _buildContent(context, alignRight: false),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, {required bool alignRight}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: alignRight && !Responsive.isMobile(context)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            experience.role,
            style: AppTextStyles.headline.copyWith(fontSize: 20),
            textAlign: alignRight && !Responsive.isMobile(context)
                ? TextAlign.right
                : TextAlign.left,
          ),
          const SizedBox(height: 4),
          Text(
            experience.company,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          if (Responsive.isMobile(context)) ...[
            const SizedBox(height: 4),
            _buildDateChip(),
          ],
          const SizedBox(height: 12),
          Text(
            experience.description,
            style: AppTextStyles.bodyMedium,
            textAlign: alignRight && !Responsive.isMobile(context)
                ? TextAlign.right
                : TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildDate({required bool alignRight}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: alignRight ? Alignment.topRight : Alignment.topLeft,
      child: _buildDateChip(),
    );
  }

  Widget _buildDateChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.charcoal),
      ),
      child: Text(
        experience.period,
        style: GoogleFonts.inter(fontSize: 12, color: AppColors.textDim),
      ),
    );
  }
}
