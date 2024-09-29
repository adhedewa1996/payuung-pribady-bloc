import 'package:flutter/material.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.title,
    required this.hint,
    required this.data,
    required this.callback,
    this.isRequired = false,
    this.enable = true,
    this.useBottomPadding = true,
    this.selected,
  });

  final String title;
  final String hint;
  final List<String> data;
  final Function(String) callback;
  final bool isRequired;
  final bool enable;
  final bool? useBottomPadding;
  final String? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        DropdownButtonFormField<String>(
          value: selected == '' ? null : selected,
          hint: Text(hint),
          onChanged: !enable
              ? null
              : (value) {
                  callback.call(value ?? '');
                },
          validator: (value) {
            if (isRequired) {
              if (value == null || value.isEmpty) {
                return 'Kolom ini Wajib diisi';
              }
            }

            return null;
          },
          items: data.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          dropdownColor: Colors.white,
        ),
        if (useBottomPadding ?? false) Spacing.vertical(12),
      ],
    );
  }
}
