import 'package:check_in/constants/app_colors.dart';
import 'package:check_in/global_styles/global_styles.dart';
import 'package:flutter/material.dart';

class PasswordCustom extends StatefulWidget {
  const PasswordCustom(
      {Key? key,
      this.hintText,
      required this.inputType,
      required this.controller,
      this.inputAction,
      this.onChangeFunction,
      this.prefixIcon,
      this.validator})
      : super(key: key);
  final String? hintText;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final controller;
  final String? Function(String?)? validator;
  final Function(String)? onChangeFunction;

  final prefixIcon;

  @override
  _PassWordCustomState createState() => _PassWordCustomState();
}

class _PassWordCustomState extends State<PasswordCustom> {
  bool onTapIcon = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: widget.hintText,
            fillColor: AppColors.white,
            filled: true,
            errorMaxLines: 3,
            hintStyle: TextStyle(color: AppColors.gray),
            isDense: true,
            prefixIcon: widget.prefixIcon ?? null,
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
          controller: widget.controller,
          // validator: widget.validator,
          maxLines: 1,
          textAlign: TextAlign.start,
          obscureText: onTapIcon,
          keyboardType: widget.inputType,
          textInputAction: widget.inputAction,
          onChanged: widget.onChangeFunction,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                onTapIcon = !onTapIcon;
              });
            },
            child: AnimatedCrossFade(
              duration: Duration(milliseconds: 300),
              firstChild: Icon(Icons.visibility_off_outlined),
              secondChild: Icon(
                Icons.visibility_outlined,
                color: AppColors.main,
              ),
              crossFadeState: onTapIcon
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
        ),
      ],
    );
  }
}
