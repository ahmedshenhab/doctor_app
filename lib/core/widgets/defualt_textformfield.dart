import '../theming/colors.dart';
import '../theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefualtTextFormField extends StatelessWidget {
  const DefualtTextFormField({
    super.key,
    this.enabledBorder,
    this.focusedBorder,
    this.hintStyle,
    this.style,
    required this.hintText,
    this.obscureText,
    this.suffixIcon,
    this.contentPadding,
    this.fillColor,
    required this.validator,
    this.controller,
    required this.keyboardType,
  });

  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;

  final TextStyle? hintStyle;
  final TextStyle? style;
  final String hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      // onTapOutside: (_) {
      //   FocusManager.instance.primaryFocus?.unfocus();
      // },
      decoration: InputDecoration(
        isDense: true,

        filled: true,
        fillColor: fillColor ?? ColorManager.moreLightGrey,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: ColorManager.lightergrey,
                width: 1.3,
              ),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: ColorManager.mainBlue,
                width: 1.3,
              ),
            ),

        hintText: hintText,
        hintStyle:
            hintStyle ?? TextStyles.font14ligtgreyRegular,
        suffixIcon: suffixIcon,
      ),

      obscureText: obscureText ?? false,
      style: style ?? TextStyles.font14DarkBlueMedium,
    );
  }
}
