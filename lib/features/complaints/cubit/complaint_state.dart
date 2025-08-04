part of 'complaint_cubit.dart';

class ComplaintState {
  final String title;
  final String description;
  final File? selectedImage;

  ComplaintState({
    required this.title,
    required this.description,
    required this.selectedImage,
  });

  ComplaintState copyWith({
    String? title,
    String? description,
    File? selectedImage,
  }) {
    return ComplaintState(
      title: title ?? this.title,
      description: description ?? this.description,
      selectedImage: selectedImage,
    );
  }
}
