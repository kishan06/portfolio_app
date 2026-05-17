import 'package:portfolio_app/core/constants/app_constants.dart';
import 'package:portfolio_app/data/models/experience_model.dart';
import 'package:portfolio_app/data/models/project_model.dart';

class StaticData {
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: "FinTrack Pro",
      description:
          "A comprehensive personal finance tracker with real-time sync across devices and interactive chart visualizations.",
      imageUrl: AppAssets.project1Image,
      techStack: ["Flutter", "Firebase", "Riverpod"],
    ),
    ProjectModel(
      title: "ConnectHub",
      description:
          "Social networking platform for remote developers featuring real-time chat and collaborative workspaces.",
      imageUrl: AppAssets.project2Image,
      techStack: ["Dart", "Bloc", "WebSockets"],
    ),
    ProjectModel(
      title: "HealthPulse",
      description:
          "IoT-integrated fitness application connecting to wearable devices to track vitals and sleep patterns.",
      imageUrl: AppAssets.project3Image,
      techStack: ["Flutter", "Bluetooth LE", "Provider"],
    ),
  ];

  static final List<ExperienceModel> experience = [
    ExperienceModel(
      role: "Senior Software Developer",
      company: "Idealake Technologies Pvt Ltd",
      period: "Feb 2025 – Present",
      description:
          "• Building enterprise-scale government portals using FlutterFlow.\n• Developed high-traffic Income Tax modules used at population scale.\n• Built fintech systems for Tata Mutual Funds.\n• Collaborated directly with FlutterFlow engineering teams.",
    ),
    ExperienceModel(
      role: "Flutter Team Lead",
      company: "WDIPL Pvt Ltd",
      period: "Jun 2023 – Feb 2025",
      description:
          "• Led a team of 7 Flutter developers.\n• Deployed 10+ apps on Play Store & App Store.\n• Built fintech platforms with 100K+ downloads.\n• Reduced development time using AI-assisted workflows.\n• Improved company profitability by optimizing delivery speed.\n• Architected scalable Flutter + Laravel systems.",
    ),
    ExperienceModel(
      role: "Flutter Developer",
      company: "WDIPL Pvt Ltd",
      period: "Jun 2022 – Jun 2023",
      description:
          "• Developed production-grade fintech & health-tech apps.\n• Integrated KYC, Google Maps, Pedometer & Deep Linking.\n• Built real-time trading and portfolio tracking features.\n• Worked on REST APIs and backend integrations.",
    ),
  ];
}
