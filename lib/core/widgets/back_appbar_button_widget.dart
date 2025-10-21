import 'package:erp/core/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';

class AppBarBackButtonWidget extends StatelessWidget {
  const AppBarBackButtonWidget({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            context.pop();
          },
      child: const Icon(
        Icons.arrow_back,
      ),
    );
  }
}
