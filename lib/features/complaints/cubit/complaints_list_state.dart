part of 'complaints_list_cubit.dart';

class ComplaintsListState {
  final List<ComplaintModel> complaints;
  final Status status;

  ComplaintsListState({
    required this.complaints,
    required this.status,
  });

  factory ComplaintsListState.initial() {
    return ComplaintsListState(
      complaints: [],
      status: Status.initial,
    );
  }

  ComplaintsListState copyWith({
    List<ComplaintModel>? complaints,
    Status? status,
  }) {
    return ComplaintsListState(
      complaints: complaints ?? this.complaints,
      status: status ?? this.status,
    );
  }
}
