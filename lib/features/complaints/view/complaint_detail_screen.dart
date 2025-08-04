import 'package:flutter/material.dart';
import 'package:gram_setu/shared/widgets/status_badge.dart';

import '../../../models/complaint_model.dart';

class ComplaintDetailsScreen extends StatelessWidget {
  final ComplaintModel complaint;

  const ComplaintDetailsScreen({Key? key, required this.complaint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: complaint.imageUrl != null
                  ? Image.network(complaint.imageUrl!)
                  : Container(
                      height: 180,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child:
                          const Icon(Icons.image, size: 80, color: Colors.grey),
                    ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              complaint.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Submitted Date
            Text(
              'Submitted: ${complaint.createdAtDate}',
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 8),

            // Status
            StatusBadge(status: complaint.status),

            const SizedBox(height: 16),

            // Description
            Text(
              complaint.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
