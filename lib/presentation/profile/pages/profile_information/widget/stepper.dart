import 'dart:developer';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/personal_information/personal_data/personal_data_cubit.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({
    super.key,
    required this.move,
  });

  final Function(int) move;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalDataCubit, PersonalDataState>(
      listener: (context, state) {
        log('SOMETHING CHANGE');
      },
      builder: (context, state) {
        return state.when(
          initial: () => SizedBox(),
          loading: () => SizedBox(),
          empty: () => SizedBox(),
          success: (informationDataModel, activeStep) {
            log('activeStep $activeStep');
            return _body(
              context: context,
              activeStep: activeStep,
            );
          },
          error: (error) => SizedBox(),
        );
      },
    );
  }

  Widget _body({required BuildContext context, required activeStep}) {
    return EasyStepper(
      activeStep: activeStep,
      lineStyle: LineStyle(
        lineLength: 50,
        lineType: LineType.normal,
        lineThickness: 3,
        lineSpace: 0,
        lineWidth: 10,
        unreachedLineType: LineType.normal,
        unreachedLineColor: context.theme().primaryColor.withOpacity(0.5),
        activeLineColor: context.theme().primaryColor.withOpacity(0.5),
        finishedLineColor: context.theme().primaryColor,
        progress: .5,
      ),
      stepBorderRadius: 15,
      borderThickness: 2,
      internalPadding: 0,
      stepRadius: 32,
      finishedStepBorderColor: Colors.transparent,
      finishedStepTextColor: Colors.transparent,
      finishedStepBackgroundColor: context.theme().primaryColor,
      activeStepIconColor: Colors.transparent,
      unreachedStepIconColor: Colors.transparent,
      unreachedStepBackgroundColor: context.theme().primaryColor.withOpacity(0.5),
      unreachedStepBorderColor: Colors.transparent,
      unreachedStepTextColor: Colors.transparent,
      activeStepBackgroundColor: context.theme().primaryColor,
      activeStepTextColor: Colors.transparent,
      activeStepBorderColor: Colors.transparent,
      finishedStepIconColor: Colors.transparent,
      showLoadingAnimation: false,
      onStepReached: (index) {
        context.read<PersonalDataCubit>().changePage(index);
        widget.move.call(index);
      },
      steps: [
        _stepperItem(
          context: context,
          number: '1',
          title: 'Biodata Diri',
        ),
        _stepperItem(
          context: context,
          number: '2',
          title: 'Alamat\nPribadi',
        ),
        _stepperItem(
          context: context,
          number: '3',
          title: 'Informasi\nPerusahaan',
        ),
      ],
    );
  }

  EasyStep _stepperItem({
    required BuildContext context,
    required String number,
    required String title,
  }) {
    return EasyStep(
      customStep: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: SizedBox(
          width: 55,
          height: 55,
          child: Center(
            child: Text(
              number,
              textAlign: TextAlign.center,
              style: context.theme().textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      customTitle: Text(
        title,
        textAlign: TextAlign.center,
        style: context.theme().textTheme.titleMedium?.copyWith(color: context.theme().primaryColor),
      ),
    );
  }
}
