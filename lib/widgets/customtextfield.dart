import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends TextFormField {
  final String labelText;
  final IconData prefixIcon;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  CustomTextField({
    required this.labelText,
    required this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.inputFormatters,
    this.maxLength,
    super.key,
    super.controller,
  }) : super(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Cant be empty';
            }
            return null;
          },
          buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) =>
              const SizedBox(),
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: const TextStyle(color: Colors.white),
          obscureText: obscureText ?? false,
          maxLength: maxLength,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(prefixIcon, size: 20),
          ),
        );
}
