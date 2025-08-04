import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/complaint_cubit.dart';

class AddComplaintsScreen extends StatelessWidget {
  const AddComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComplaintCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Raise a Complaint'),
          backgroundColor: Colors.green.shade700,
        ),
        body: BlocBuilder<ComplaintCubit, ComplaintState>(
          builder: (context, state) {
            final cubit = context.read<ComplaintCubit>();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      onChanged: cubit.updateTitle,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: cubit.updateDescription,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: cubit.pickImage,
                          icon: const Icon(Icons.image),
                          label: const Text('Pick Image'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                          ),
                        ),
                        const SizedBox(width: 16),
                        if (state.selectedImage != null)
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.file(
                                state.selectedImage!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              IconButton(
                                onPressed: cubit.removeImage,
                                icon: const Icon(Icons.close, color: Colors.red),
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        // To be implemented: Submit logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      ),
                      child: const Text('Submit Complaint'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
