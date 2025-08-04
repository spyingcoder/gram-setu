import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gram_setu/features/complaints/cubit/complaints_list_cubit.dart';
import 'package:gram_setu/features/complaints/view/complaint_detail_screen.dart';
import 'package:gram_setu/models/complaint_model.dart';
import 'package:gram_setu/shared/utility/enums.dart';

class ComplaintsListingScreen extends StatelessWidget {
  const ComplaintsListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComplaintsListCubit()..loadComplaints(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Complaints"),
        ),
        body: BlocBuilder<ComplaintsListCubit, ComplaintsListState>(
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == Status.error) {
              return const Center(child: Text("Something went wrong"));
            }

            if (state.complaints.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.report_problem_outlined,
                        size: 60, color: Colors.grey),
                    SizedBox(height: 12),
                    Text("No complaints submitted yet.",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ComplaintsListCubit>().loadComplaints();
              },
              child: ListView.builder(
                itemCount: state.complaints.length,
                itemBuilder: (context, index) {
                  final complaint = state.complaints[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ComplaintDetailsScreen(complaint: complaint),
                        ),
                      );
                    },
                    child: ComplaintCard(complaint: complaint),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ComplaintCard extends StatelessWidget {
  final ComplaintModel complaint;

  const ComplaintCard({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    final statusColor =
        complaint.status == "Resolved" ? Colors.green : Colors.orange;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          complaint.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(complaint.description),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                complaint.status,
                style:
                    TextStyle(color: statusColor, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
