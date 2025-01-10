import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:crypto_challenge/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CGWarningConfirmed extends StatefulWidget {
  final String title;
  final String description;
  final void Function()? onConfirm;

  const CGWarningConfirmed({super.key, required this.title, required this.description, this.onConfirm});

  static Future<void> show(BuildContext context, {required String title, required String description, void Function()? onConfirm}) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CGWarningConfirmed(title: title, description: description, onConfirm: onConfirm);
      },
    );
  }

  @override
  State<CGWarningConfirmed> createState() => _CGWarningConfirmedState();
}

class _CGWarningConfirmedState extends State<CGWarningConfirmed> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      backgroundColor: AppColors.white,
      title: Text(widget.title, style: AppTextStyle.familyMulishW700s16),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(widget.description, style: AppTextStyle.familyMulishW400s14),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(foregroundColor: AppColors.red),
          child: Text('Cancelar', style: AppTextStyle.familyMulishW600s16.copyWith(color: AppColors.red)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Confirmar', style: AppTextStyle.familyMulishW600s16.copyWith(color: AppColors.primaryDark)),
          onPressed: () {
            Navigator.of(context).pop();
            widget.onConfirm?.call();
          },
        ),
      ],
    );
  }
}
