import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin(
      {Key? key,
      this.hintText,
      this.controller,
      this.inputType,
      this.inputAction,
      this.validator,
      this.onChangeFunction,
      this.inputFormatCustom,
      this.prefixIcon,
      this.maxLengthText})
      : super(key: key);

  final String? hintText;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final controller;
  final String? Function(String?)? validator;
  final Function(String)? onChangeFunction;
  final FilteringTextInputFormatter? inputFormatCustom;
  final int? maxLengthText;
  final prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        fillColor: AppColors.white,
        filled: true,
        counterText: "",
        isDense: true,
        // errorStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: AppColors.gray),
        contentPadding: GlobalStyles.paddingAll18,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.gray),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.main),
            borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(8)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(8)),
      ),
      style: TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
      controller: controller,
      // validator: validator,
      inputFormatters: [
        inputFormatCustom ?? FilteringTextInputFormatter.singleLineFormatter
      ],
      textAlign: TextAlign.start,
      maxLines: 1,
      maxLength: maxLengthText ?? null,
      autofocus: false,
      keyboardType: inputType,
      textInputAction: inputAction,
      onChanged: onChangeFunction,
    );
  }
}
