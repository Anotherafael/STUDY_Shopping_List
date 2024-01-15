import 'package:flutter/material.dart';

class AddItemTextFormFieldWidget extends StatelessWidget {
  const AddItemTextFormFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.maxLength,
    this.keyboardType,
    this.initialValue,
    this.validator,
    this.onSaved,
  });

  final String label;
  final String hintText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLength: maxLength,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
      ),
      initialValue: initialValue,
      keyboardType: keyboardType,
      onSaved: onSaved,
    );
  }
}
