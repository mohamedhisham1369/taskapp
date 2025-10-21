import 'package:erp/core/themes/app_colors.dart';
import 'package:erp/core/themes/text_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final BorderSide? borderColor;
  final double? elevation;
  final bool? enableShadow;
  final bool? isEnabled;
  final bool? haveTextStyle;
  final TextStyle? textStyle;
  final List<Color>? gradientColors;
  final List<BoxShadow>? boxShadow;

  const CustomButtonWidget({
    super.key,
    this.onPressed,
    this.textStyle,
    this.iconData,
    this.text,
    this.color,
    this.textColor,
    this.haveTextStyle = false,
    this.fontSize = 20,
    this.fontWeight,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius = 8,
    this.borderColor,
    this.elevation,
    this.enableShadow,
    this.isEnabled,
    this.gradientColors,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.9,
        height: height ?? 50.h,
        margin: margin,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          gradient: gradientColors != null
              ? LinearGradient(
                  colors: gradientColors!,
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter)
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor?.color ?? Colors.transparent),
          color: color ?? AppColors.primaryColor900,
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.3),
                  spreadRadius: -1,
                  blurRadius: 5.sp,
                ),
              ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    text!,
                    style: haveTextStyle == true
                        ? textStyle
                        : Styles.contentEmphasis.copyWith(
                            color: textColor ?? AppColors.neutralColor100,
                            fontSize: fontSize,
                            fontWeight: fontWeight,
                          ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              2.horizontalSpace,
              if (iconData != null) ...[
                Icon(
                  iconData,
                  color: textColor ?? AppColors.neutralColor100,
                  size: 25.sp,
                ),
                7.horizontalSpace,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
