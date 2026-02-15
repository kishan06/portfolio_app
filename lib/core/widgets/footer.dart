import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundDark,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Divider(color: Colors.white.withOpacity(0.1)),
          const SizedBox(height: 60),
          Text(
            "Ready to build something amazing?",
            style: AppTextStyles.headline.copyWith(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            "Whether you have a question or just want to say hi, I'll try my best to get back to you!\nCurrently open for new opportunities.",
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'hello@developer.com',
              );
              if (await canLaunchUrl(emailLaunchUri)) {
                await launchUrl(emailLaunchUri);
              }
            },
            icon: const Icon(Icons.email_outlined),
            label: const Text("hello@developer.com"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.backgroundDark,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              textStyle: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              elevation: 10,
              shadowColor: AppColors.primary.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 60),
          Text(
            "© 2026 Senior Flutter Developer. All rights reserved.",
            style: AppTextStyles.bodyMedium.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
