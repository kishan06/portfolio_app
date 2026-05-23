import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/theme/app_theme.dart';
import 'package:portfolio_app/routes/app_routes.dart';
import 'package:portfolio_app/core/utils/responsive.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:flutter_animate/flutter_animate.dart';

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
            text: "Kishan Bhuta",
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
      icon: const Icon(Icons.menu_rounded, color: AppColors.textLight, size: 28),
      onPressed: () {
        Get.dialog(
          _buildBeautifulMobileMenu(),
          useSafeArea: false,
          barrierColor: Colors.black.withOpacity(0.4),
        );
      },
    );
  }

  Widget _buildBeautifulMobileMenu() {
    return Material(
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.backgroundDark.withOpacity(0.85),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close_rounded, color: AppColors.textLight, size: 36),
                  onPressed: () => Get.back(),
                ),
              ),
              const Spacer(flex: 1),
              _buildMobileMenuItem("Home", Routes.LANDING, 0),
              const SizedBox(height: 40),
              _buildMobileMenuItem("Work", Routes.WORK, 1),
              const SizedBox(height: 40),
              _buildMobileMenuItem("Journey", Routes.JOURNEY, 2),
              const Spacer(flex: 2),
              Center(child: _ContactButton()),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildMobileMenuItem(String title, String route, int index) {
    final bool isActive = Get.currentRoute == route;
    return InkWell(
      onTap: () {
        Get.back(); // Close the menu
        if (!isActive) Get.offNamed(route);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isActive ? 40 : 0,
            height: 4,
            margin: EdgeInsets.only(right: isActive ? 20 : 0),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ]
                  : [],
            ),
          ),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
              color: isActive ? AppColors.textLight : AppColors.textDim,
              letterSpacing: -2,
            ),
          ),
        ],
      ),
    ).animate()
      .slideX(begin: -0.2, end: 0, duration: 600.ms, delay: (100 * index).ms, curve: Curves.easeOutCubic)
      .fadeIn(duration: 600.ms, delay: (100 * index).ms);
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

class _ContactButton extends StatefulWidget {
  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isHovering = false;

  void _showContactPopup() {
    Get.dialog(
      Center(
        child: Material(
          color: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: AppColors.navy.withOpacity(0.8),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.5),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 40,
                    spreadRadius: -10,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon header
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.handshake_rounded,
                      color: AppColors.primary,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Let's Connect",
                    style: GoogleFonts.inter(
                      color: AppColors.textLight,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "I'm always open to discussing product design work or partnership opportunities.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: AppColors.textDim,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildContactItem(
                    icon: Icons.email_outlined,
                    title: "Email",
                    value: "kishan.bhuta1998@gmail.com",
                  ),
                  const SizedBox(height: 20),
                  _buildContactItem(
                    icon: Icons.phone_outlined,
                    title: "Phone",
                    value: "+91 9158874404",
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.backgroundDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Get.back(),
                      child: Text(
                        "Close",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: value));
        Get.snackbar(
          "Copied!",
          "$title copied to clipboard",
          backgroundColor: AppColors.primary.withOpacity(0.9),
          colorText: AppColors.backgroundDark,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          borderRadius: 12,
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.backgroundDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      color: AppColors.textDim,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: GoogleFonts.inter(
                      color: AppColors.textLight,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.copy_rounded,
              color: AppColors.textDim,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _showContactPopup,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovering
                ? AppColors.primary.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primary),
            boxShadow: [
              if (_isHovering)
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                )
              else
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
            ],
          ),
          child: Text(
            "Let's Connect",
            style: GoogleFonts.inter(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
