// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../constant/const.dart';

class TextFormFieldWidgets extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isObsecuredText;
  final String? obsecureCharacter;

  const TextFormFieldWidgets({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.isObsecuredText = false,
    required this.controller,
    this.obsecureCharacter = '*',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecuredText!,
      obscuringCharacter: obsecureCharacter!,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: PRIMARY_COLOR,
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: ERROR_COLOR,
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: ERROR_COLOR,
            width: 2,
          ),
        ),
      ),
    );
  }
}
