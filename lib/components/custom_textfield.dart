import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final TextAlign? align;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? enabledField;

  CustomTextField(this.hintText,
      {this.suffixIcon,
      this.onChanged,
      this.keyboardType,
      this.prefixIcon,
      this.align,
      this.errorText,
      this.controller,
      this.obscureText,
      this.enabledField });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: align ?? TextAlign.start,
      controller: controller,
      keyboardType: keyboardType,

      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabled: enabledField ?? true,
        fillColor: Color(0xFFF6F6F6),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1, color: Colors.blueAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1, color: Color(0XFFE8E8E8)),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
