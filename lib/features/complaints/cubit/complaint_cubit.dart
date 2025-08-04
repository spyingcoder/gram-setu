import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'complaint_state.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  ComplaintCubit()
      : super(ComplaintState(
          title: '',
          description: '',
          selectedImage: null,
        ));

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
}
