import 'package:calculator_camera/app/bloc/storage/storage_cubit.dart';
import 'package:calculator_camera/app/common/constants.dart';
import 'package:calculator_camera/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBottomSheet extends StatefulWidget {
  const HomeBottomSheet({super.key});

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: BlocBuilder<StorageCubit, UseStorage>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                AppButton.checkBoxButton(
                  title: 'Use File Storage',
                  context: context,
                  item: UseStorage.file,
                  selected: state,
                  callback: (value) {
                    context.read<StorageCubit>().changeStorage(value: value, context: context);
                  },
                ),
                AppButton.checkBoxButton(
                  title: 'Use Database Storage',
                  context: context,
                  item: UseStorage.database,
                  selected: state,
                  callback: (value) {
                    context.read<StorageCubit>().changeStorage(value: value, context: context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
