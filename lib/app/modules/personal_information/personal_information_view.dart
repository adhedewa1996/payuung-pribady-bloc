import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/spacing.dart';
import 'package:payuung_pribadi_app/app/core/config/theme/app_colors.dart';
import 'package:payuung_pribadi_app/app/modules/personal_information/widgets/company_information.dart';
import 'package:payuung_pribadi_app/app/modules/personal_information/widgets/personal_address.dart';
import 'package:payuung_pribadi_app/app/modules/personal_information/widgets/personal_data.dart';

import 'personal_information_controller.dart';

class PersonalInformationView extends GetView<PersonalInformationController> {
  const PersonalInformationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Informasi Pribadi',
          style: context.textTheme.titleLarge,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.veryLightGrey,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: AppColors.veryLightGrey,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _stepper(step: controller.step.value, context: context),
            Spacing.vertical(16),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller.tabController,
                children: [
                  PersonalDataWidget(controller: controller),
                  PersonalAddressWidget(controller: controller),
                  CompanyInformationWidget(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepper({
    required StepData step,
    required BuildContext context,
  }) {
    return Obx(() {
      return EasyStepper(
        activeStep: controller.selectedStep.value,
        lineStyle: LineStyle(
          lineLength: 50,
          lineType: LineType.normal,
          lineThickness: 3,
          lineSpace: 0,
          lineWidth: 10,
          unreachedLineType: LineType.normal,
          unreachedLineColor: context.theme.primaryColor.withOpacity(0.5),
          activeLineColor: context.theme.primaryColor.withOpacity(0.5),
          finishedLineColor: context.theme.primaryColor,
          progress: .5,
        ),
        stepBorderRadius: 15,
        borderThickness: 2,
        internalPadding: 0,
        stepRadius: 32,
        finishedStepBorderColor: Colors.transparent,
        finishedStepTextColor: Colors.transparent,
        finishedStepBackgroundColor: context.theme.primaryColor,
        activeStepIconColor: Colors.transparent,
        unreachedStepIconColor: Colors.transparent,
        unreachedStepBackgroundColor: context.theme.primaryColor.withOpacity(0.5),
        unreachedStepBorderColor: Colors.transparent,
        unreachedStepTextColor: Colors.transparent,
        activeStepBackgroundColor: context.theme.primaryColor,
        activeStepTextColor: Colors.transparent,
        activeStepBorderColor: Colors.transparent,
        finishedStepIconColor: Colors.transparent,
        showLoadingAnimation: false,
        onStepReached: (index) {
          controller.move(value: index);
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
    });
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
              style: context.textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      customTitle: Text(
        title,
        textAlign: TextAlign.center,
        style: context.textTheme.titleMedium?.copyWith(color: context.theme.primaryColor),
      ),
    );
  }
}
