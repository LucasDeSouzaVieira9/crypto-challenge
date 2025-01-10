import 'package:flutter/material.dart';

class CGEmptyState extends StatelessWidget {
  final String? message;
  const CGEmptyState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error),
          const SizedBox(height: 20),
          Text(
            message ?? 'Nenhum informação encontrada!',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
