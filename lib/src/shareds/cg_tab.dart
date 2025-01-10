import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:crypto_challenge/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CGTab<T> extends StatefulWidget {
  const CGTab({
    super.key,
    required this.items,
    this.valueSelected,
    this.onChanged,
    this.separatorWidth,
    this.colorNotSelected,
    this.padding,
    this.widthItem,
  });
  final double? separatorWidth;
  final Color? colorNotSelected;
  final List<MLTabDto<T>> items;
  final T? valueSelected;
  final Function(dynamic value)? onChanged;
  final EdgeInsetsGeometry? padding;
  final double? widthItem;

  @override
  State<CGTab> createState() => _CGTabState<T>();
}

class _CGTabState<T> extends State<CGTab> {
  T? valueSelected;

  @override
  void initState() {
    super.initState();
    valueSelected = widget.valueSelected;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 38,
      child: ListView.separated(
        padding: widget.padding,
        separatorBuilder: (context, index) => SizedBox(width: widget.separatorWidth ?? 12),
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final isSelected = valueSelected == item.value;

          return InkWell(
            onTap: () {
              setState(() => valueSelected = item.value);
              if (widget.onChanged != null) widget.onChanged!(valueSelected);
              item.onTap?.call();
            },
            child: Container(
              width: widget.widthItem,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : widget.colorNotSelected ?? Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: isSelected ? null : Border.all(color: AppColors.primary, width: 1.2),
              ),
              child: Center(
                child: Text(
                  item.text,
                  style: AppTextStyle.familyMulishW700s14.copyWith(color: isSelected ? AppColors.white : AppColors.primary),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MLTabDto<T> {
  final T value;
  final String text;
  final void Function()? onTap;

  MLTabDto({required this.value, this.onTap, required this.text});
}
