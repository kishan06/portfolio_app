import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/theme/app_theme.dart';
import 'package:portfolio_app/routes/app_routes.dart';
import 'package:portfolio_app/core/utils/responsive.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      color: AppColors.backgroundDark.withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(),
          if (!Responsive.isMobile(context)) _buildDesktopMenu(),
          if (Responsive.isMobile(context)) _buildMobileMenuIcon(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textLight,
        ),
        children: [
          const TextSpan(text: "<"),
          TextSpan(
            text: "DevName",
            style: TextStyle(color: AppColors.primary),
          ),
          const TextSpan(text: " />"),
        ],
      ),
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      children: [
        _NavBarItem(title: "Home", route: Routes.LANDING),
        const SizedBox(width: 32),
        _NavBarItem(title: "Work", route: Routes.WORK),
        const SizedBox(width: 32),
        _NavBarItem(title: "Journey", route: Routes.JOURNEY),
        const SizedBox(width: 32),
        _ContactButton(),
      ],
    );
  }

  Widget _buildMobileMenuIcon() {
    return IconButton(
      icon: const Icon(Icons.menu, color: AppColors.textLight),
      onPressed: () {
        // TODO: Implement mobile drawer or bottom sheet
        Get.defaultDialog(
          title: "Menu",
          backgroundColor: AppColors.navy,
          titleStyle: AppTextStyles.headline,
          content: Column(
            children: [
              _NavBarItem(title: "Home", route: Routes.LANDING),
              _NavBarItem(title: "Work", route: Routes.WORK),
              _NavBarItem(title: "Journey", route: Routes.JOURNEY),
            ],
          ),
        );
      },
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final String route;

  const _NavBarItem({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    final bool isActive = Get.currentRoute == route;
    return InkWell(
      onTap: () => Get.offNamed(route),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isActive ? AppColors.primary : AppColors.textLight,
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        "Let's Connect",
        style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
      ),
    );
  }
}
