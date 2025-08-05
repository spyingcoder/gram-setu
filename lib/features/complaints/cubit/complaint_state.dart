part of 'complaint_cubit.dart';

class ComplaintState {
  final String title;
  final String description;
  final File? selectedImage;
  final Status status;

  ComplaintState({
    required this.title,
    required this.description,
    required this.selectedImage,
    required this.status,
  });

  factory ComplaintState.initial() => ComplaintState(
        title: '',
        description: '',
        selectedImage: null,
        status: Status.initial,
      );

  ComplaintState copyWith({
    String? title,
    String? description,
    File? selectedImage,
    Status? status,
  }) {
    return ComplaintState(
      title: title ?? this.title,
      description: description ?? this.description,
      selectedImage: selectedImage ?? this.selectedImage,
      status: status ?? this.status,
    );
  }
}
