import 'package:erp/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.rowWidget,
  });

  final Widget rowWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Color Overlay
        Container(
          height: 152.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
            color: AppColors.primaryColor900,
          ),
        ),

        /// Image of AppBar with 15% opacity
        Opacity(
          opacity: 0.08,
          child: Container(
            height: 152.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
              // image: DecorationImage(
              //   image: AssetImage(
              //     'assets/images/pngs/bg_image_of_appbar.png',
              //   ),
              //   fit: BoxFit.fill,
              // ),
            ),
          ),
        ),

        /// Positioned widget directly inside the Stack
        Positioned(
          right: 15.w,
          left: 15.w,
          bottom: 20.h,
          child: rowWidget,
          // child: ,
        ),
      ],
    );
  }
}
