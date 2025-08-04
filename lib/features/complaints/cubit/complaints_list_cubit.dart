import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gram_setu/models/complaint_model.dart';
import 'package:gram_setu/shared/utility/enums.dart';

part 'complaints_list_state.dart';

class ComplaintsListCubit extends Cubit<ComplaintsListState> {
  ComplaintsListCubit() : super(ComplaintsListState.initial());

  void loadComplaints() async {
    emit(state.copyWith(status: Status.loading));

    await Future.delayed(const Duration(seconds: 1));

    try {
      final dummyList = List.generate(
        5,
        (index) => ComplaintModel(
          id: index,
          title: 'Issue #$index',
          description: 'Details for complaint $index',
          status: index % 2 == 0 ? 'Pending' : 'Resolved',
          imageUrl: null,
          createdAt: DateTime.now().subtract(Duration(days: index)),
          updatedAt: DateTime.now(),
        ),
      );

      emit(state.copyWith(complaints: dummyList, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }
}
