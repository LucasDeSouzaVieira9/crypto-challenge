import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class CGPullToRefresh extends StatelessWidget {
  const CGPullToRefresh({super.key, required this.onRefresh, required this.child, this.showChildOpacityTransition = false});
  final Future<void> Function() onRefresh;
  final Widget child;
  final bool showChildOpacityTransition;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: onRefresh,
      showChildOpacityTransition: showChildOpacityTransition,
      backgroundColor: AppColors.primary,
      springAnimationDurationInMilliseconds: 500,
      color: Colors.transparent,
      child: child,
    );
  }
}
