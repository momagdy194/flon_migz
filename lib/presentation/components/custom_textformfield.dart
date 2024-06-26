import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gshop/presentation/style/style.dart';
import 'package:gshop/presentation/style/theme/theme_warpper.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscure;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validation;
  final TextInputType? inputType;
  final String? initialText;
  final bool readOnly;
  final bool isError;
  final bool filled;
  final bool autoFocus;
  final double radius;
  final Color? borderColor;
  final Color? fillColor;
  final Color? hintColor;

  const CustomTextFormField({
    Key? key,
    this.suffixIcon,
    this.borderColor,
    this.prefixIcon,
    this.hintColor,
    this.onTap,
    this.fillColor,
    this.filled = false,
    this.obscure,
    this.validation,
    this.onChanged,
    this.controller,
    this.inputType,
    this.initialText,
    this.readOnly = false,
    this.isError = false,
    this.hint = "",
    this.radius = 16,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, c) {
      return TextFormField(
        autofocus: autoFocus,
        onTap: onTap,
        maxLength: 200,
        onChanged: onChanged,
        autocorrect: true,
        obscureText: !(obscure ?? true),
        obscuringCharacter: '*',
        controller: controller,
        validator: validation,
        style: CustomStyle.interNormal(
          size: 14.sp,
          color: colors.primary,
        ),
        cursorWidth: 1,
        cursorColor: colors.textBlack,
        keyboardType: inputType,
        initialValue: initialText,
        readOnly: readOnly,
        decoration: InputDecoration(
          counterText: "",
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
          hintText: hint,
          hintStyle: CustomStyle.interNormal(
            size: 14.sp,
            color: (borderColor ?? CustomStyle.primary),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          fillColor: fillColor ?? CustomStyle.black,
          filled: filled,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.merge(
                  BorderSide(color: borderColor ?? CustomStyle.primary),
                  BorderSide(color: borderColor ?? CustomStyle.primary)),
              borderRadius: BorderRadius.circular(radius.r)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.merge(
                  BorderSide(color: borderColor ?? CustomStyle.primary),
                  BorderSide(color: borderColor ?? CustomStyle.primary)),
              borderRadius: BorderRadius.circular(radius.r)),
          border: OutlineInputBorder(
              borderSide: BorderSide.merge(
                  BorderSide(color: borderColor ?? CustomStyle.primary),
                  BorderSide(color: borderColor ?? CustomStyle.primary)),
              borderRadius: BorderRadius.circular(radius.r)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.merge(
                  BorderSide(color: borderColor ?? CustomStyle.primary),
                  BorderSide(color: borderColor ?? CustomStyle.primary)),
              borderRadius: BorderRadius.circular(radius.r)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.merge(
                  BorderSide(color: borderColor ?? CustomStyle.primary),
                  BorderSide(color: borderColor ?? CustomStyle.primary)),
              borderRadius: BorderRadius.circular(radius.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.merge(
                  BorderSide(color: borderColor ?? CustomStyle.primary),
                  BorderSide(color: borderColor ?? CustomStyle.primary)),
              borderRadius: BorderRadius.circular(radius.r)),
        ),
      );
    });
  }
}
