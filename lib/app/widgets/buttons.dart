import 'package:calculator_camera/app/bloc/theme/theme_cubit.dart';
import 'package:calculator_camera/app/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppButton {
  static Widget common({
    required BuildContext context,
    required Function() callback,
    required IconData icon,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        shape: CircleBorder(),
      ),
      onPressed: () {
        callback.call();
      },
      child: Icon(icon),
    );
  }

  static Widget checkBoxButton({
    required UseStorage item,
    required UseStorage selected,
    required String title,
    required BuildContext context,
    required Function(UseStorage) callback,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Radio(
          value: selected == item,
          onChanged: (value) {
            callback.call(item);
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return context.read<ThemeCubit>().state.primaryColor;
            },
          ),
          groupValue: true,
        ),
      ],
    );
  }
}
