import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.keyboardType,
      this.readOnly,
      this.hintTextColor,
      this.inputFormatters,
      this.maxLines,
      this.onChanged,
      this.suffixIcon,
      this.prefixIcon,
      this.horizontalContentPadding,
      this.verticalContentPadding,
      this.obscureText,
      this.onTap});

  final TextEditingController? controller;
  final String? hintText;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? horizontalContentPadding;
  final double? verticalContentPadding;
  final bool? obscureText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(-3, -3),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white70,
            offset: Offset(3, 3),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        inputFormatters: inputFormatters,
        readOnly: readOnly ?? false,
        cursorColor: Colors.orange,
        keyboardType: keyboardType ?? TextInputType.text,
        maxLines: maxLines ?? 1,
        textAlign: TextAlign.left,
        onTap: onTap,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(color: hintTextColor ?? Colors.grey),
            contentPadding: EdgeInsets.symmetric(
                horizontal: horizontalContentPadding ?? 12,
                vertical: verticalContentPadding ?? 12),
            border: InputBorder.none),
        onChanged: onChanged,
      ),
    );
  }
}
