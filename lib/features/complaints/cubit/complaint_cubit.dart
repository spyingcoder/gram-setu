import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gram_setu/shared/utility/enums.dart';

part 'complaint_state.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  ComplaintCubit() : super(ComplaintState.initial());

  void updateTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void updateDescription(String description) {
    emit(state.copyWith(description: description));
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      emit(state.copyWith(selectedImage: File(picked.path)));
    }
  }

  void removeImage() {
    emit(state.copyWith(selectedImage: null));
  }

  Future<void> submitComplaint() async {
    if (state.title.isEmpty || state.description.isEmpty) {
      // We may later show validation, but for now skip submission
      return;
    }

    emit(state.copyWith(status: Status.loading));

    await Future.delayed(const Duration(seconds: 2)); // Simulate submission delay

    // Simulate success (or you can simulate failure randomly for test)
    emit(state.copyWith(status: Status.success));
  }
}
