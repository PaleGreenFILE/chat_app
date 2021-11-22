import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final bool? obscureText;
  final TextInputType? keyboardType;
  const CTextField(
      {Key? key,
      this.controller,
      this.hint,
      this.prefix,
      this.obscureText = false,
      this.keyboardType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      decoration: InputDecoration(prefixIcon: prefix, hintText: hint ?? ''),
      keyboardType: keyboardType,
    );
  }
}
