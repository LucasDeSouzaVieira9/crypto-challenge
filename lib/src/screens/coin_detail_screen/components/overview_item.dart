import 'package:crypto_challenge/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class OverviewItem extends StatelessWidget {
  final String title;
  final num? value;
  final String? valueText;
  const OverviewItem({super.key, required this.title, this.value, this.valueText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: AppTextStyle.familyMulishW700s14)),
        const SizedBox(width: 10),
        Text(valueText ?? (value == null ? '-' : formatValue(value!)), style: AppTextStyle.familyMulishW700s14),
      ],
    );
  }

  String formatValue(num value) {
    if (value >= 1e12) {
      // Trilhão (T)
      return '\$${(value / 1e12).toStringAsFixed(2)}T';
    } else if (value >= 1e9) {
      // Bilhão (B)
      return '\$${(value / 1e9).toStringAsFixed(2)}B';
    } else if (value >= 1e6) {
      // Milhão (M)
      return '\$${(value / 1e6).toStringAsFixed(2)}M';
    } else if (value >= 1e3) {
      // Mil (K)
      return '\$${(value / 1e3).toStringAsFixed(2)}K';
    } else {
      return '\$$value';
    }
  }
}
