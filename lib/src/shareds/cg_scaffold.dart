import 'package:flutter/material.dart';

class CGScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final EdgeInsetsGeometry? padding;
  const CGScaffold({super.key, required this.body, this.bottomNavigationBar, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        body: SafeArea(
          child: Padding(padding: padding ?? EdgeInsets.zero, child: body),
        ),
      ),
    );
  }
}
