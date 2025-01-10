import 'package:flutter/material.dart';

class CGErroState extends StatelessWidget {
  final String? message;
  const CGErroState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
      ),
    );
  }
}
