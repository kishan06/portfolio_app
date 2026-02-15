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
      role: "Senior Flutter Developer",
      company: "TechCorp Inc.",
      period: "2021 - Present",
      description:
          "Leading a team of 5 developers. Architected the main flagship app serving 2M+ users. Reduced build times by 40%.",
    ),
    ExperienceModel(
      role: "Mobile Developer",
      company: "AppStudio Solutions",
      period: "2019 - 2021",
      description:
          "Developed 10+ apps from scratch. Migrated legacy native codebases to Flutter, saving 30% on maintenance costs.",
    ),
    ExperienceModel(
      role: "Junior Developer",
      company: "StartUp Hub",
      period: "2017 - 2019",
      description:
          "Collaborated on UI implementation and state management. Learned agile methodologies and CI/CD pipelines.",
    ),
  ];
}
