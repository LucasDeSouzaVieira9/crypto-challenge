import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:crypto_challenge/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color iconBackgroundColor;
  final Widget icon;
  const ProfileCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconBackgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(child: icon),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.familyMulishW700s16),
                Text(subtitle, style: AppTextStyle.familyMulishW400s12),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.gray),
        ],
      ),
    );
  }
}
