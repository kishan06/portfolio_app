class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String? projectUrl;
  
  // New Case Study Fields
  final String? company;
  final String? role;
  final String? duration;
  final String? projectType;
  final List<String>? contributions;
  final List<String>? impactMetrics;
  final List<String>? coreFeatures;
  
  // Action Links
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? websiteUrl;
  
  // Advanced Gallery
  final List<String>? gallery;

  ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    this.projectUrl,
    this.company,
    this.role,
    this.duration,
    this.projectType,
    this.contributions,
    this.impactMetrics,
    this.coreFeatures,
    this.playStoreUrl,
    this.appStoreUrl,
    this.websiteUrl,
    this.gallery,
  });
}

