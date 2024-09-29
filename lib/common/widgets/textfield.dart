import 'package:flutter/material.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.context,
    required this.title,
    required this.hint,
    required this.controller,
    this.isRequired = false,
    this.readOnly = false,
    this.enabled = true,
    this.suffixIcon,
    this.useBottomPadding = true,
    this.validate,
    this.keyboardType,
  });

  final BuildContext context;
  final String title;
  final String hint;
  final bool isRequired;
  final bool readOnly;
  final bool enabled;
  final Widget? suffixIcon;
  final bool? useBottomPadding;
  final TextEditingController controller;
  final Function()? validate;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (isRequired)
              Text(
                '* ',
                style: context.theme().textTheme.titleMedium?.copyWith(color: Colors.red),
              ),
            Text(title.toUpperCase()),
          ],
        ),
        Spacing.vertical(8),
        TextFormField(
          cursorHeight: 0,
          focusNode: FocusNode(),
          keyboardType: keyboardType,
          readOnly: readOnly,
          enabled: enabled,
          controller: controller,
          validator: (value) {
            if (isRequired) {
              if (value == null || value.isEmpty) {
                return 'Kolom ini Wajib diisi';
              }
            }

            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
            suffixIconConstraints: BoxConstraints(
              maxWidth: 100,
              minWidth: 50,
            ),
          ).applyDefaults(
            Theme.of(context).inputDecorationTheme,
          ),
        ),
        if (useBottomPadding ?? false) Spacing.vertical(12),
      ],
    );
  }
}
