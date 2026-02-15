class ProjectModel {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String? projectUrl;

  ProjectModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    this.projectUrl,
  });
}
