import 'package:alab/common/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      required this.text,
      this.color,
      this.textColor,
      this.height,
      this.width,
      this.loading = false,
      this.fontSize,
      this.circularProgressSize});

  final void Function()? onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? circularProgressSize;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50,
        decoration: BoxDecoration(
            gradient:
                const LinearGradient(colors: [Colors.orange, Colors.yellow]),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: loading
              ? SizedBox(
                  width: circularProgressSize ?? 20,
                  height: circularProgressSize ?? 20,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : CustomText(
                  text: text,
                  color: textColor ?? Colors.white,
                  fontSize: fontSize ?? 20,
                  fontWeight: FontWeight.w600,
                ),
        ),
      ),
    );
  }
}
