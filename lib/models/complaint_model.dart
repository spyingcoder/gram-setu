class ComplaintModel {
  final int id;
  final String title;
  final String description;
  final String status;
  final String? imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  ComplaintModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  String get createdAtDate =>
      '${createdAt.day}/${createdAt.month}/${createdAt.year}';

  String get updatedAtDate =>
      '${updatedAt.day}/${updatedAt.month}/${updatedAt.year}';
}
