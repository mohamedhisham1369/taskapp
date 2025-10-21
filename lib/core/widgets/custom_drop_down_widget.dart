import 'package:erp/core/themes/app_colors.dart';
import 'package:erp/core/themes/text_colors.dart';
import 'package:erp/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final String? hint;
  final T? value;
  final List<T> items;
  final bool isString;
  final String Function(T)? getItemText;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;

  const CustomDropdownButton({
    super.key,
    this.hint,
    this.value,
    this.isString = true,
    required this.items,
    this.getItemText,
    this.onChanged,
    this.validator,
    this.contentPadding,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      hint: hint != null
          ? Text(
              hint!,
              style: Styles.contentEmphasis.copyWith(
                color: AppColors.neutralColor600,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            )
          : null,
      icon: const Icon(Icons.arrow_drop_down_sharp,
          color: AppColors.neutralColor600),
      onChanged: enabled ?? true ? onChanged : null,
      dropdownColor: backgroundColor ?? AppColors.scaffoldBackground,
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            isString ? item.toString() : getItemText!(item),
            style: Styles.contentEmphasis.copyWith(
              color: AppColors.neutralColor600,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      validator: validator,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.neutralColor600,
            width: borderWidth ?? 1.sp,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.redColor100,
            width: borderWidth ?? 1.sp,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          borderSide: BorderSide(
            color: Colors.red,
            width: borderWidth ?? 1.sp,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          borderSide: BorderSide(
            color: Colors.red,
            width: borderWidth ?? 1.sp,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.neutralColor600,
            width: borderWidth ?? 1.sp,
          ),
        ),
        filled: true,
        fillColor: backgroundColor ?? AppColors.scaffoldBackground,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: AppColors.neutralColor600,
        suffixIconColor: AppColors.neutralColor600,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      ),
    );
  }
}
