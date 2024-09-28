import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/helper/date_extensions.dart';
import 'package:payuung_pribadi_app/app/commons/helper/dummy_helper.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/buttons.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/datepicker/calendar_bottomsheet.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/datepicker/datepicker_widget.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/dropdown/dropdown.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/spacing.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/textfield.dart';
import 'package:payuung_pribadi_app/app/modules/personal_information/personal_information_controller.dart';

class PersonalDataWidget extends StatelessWidget {
  const PersonalDataWidget({
    super.key,
    required this.controller,
  });

  final PersonalInformationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Form(
          key: controller.personalDataFormKey,
          child: Column(
            children: [
              AppTextField(
                context: context,
                title: 'Nama Lengkap',
                hint: 'Masukkan Nama Lengkap',
                isRequired: true,
                controller: controller.fullname,
              ),
              AppTextField(
                context: context,
                title: 'Tanggal',
                hint: 'Pilih Tanggal Lahir',
                isRequired: true,
                readOnly: true,
                controller: controller.dob,
                suffixIcon: IconButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    await Future.delayed(const Duration(milliseconds: 250));
                    await CalendarBottomSheet.show(
                      child: DatePickerWidget(
                        onCancel: () {
                          Get.back();
                        },
                        onSetDate: (strDate) {
                          controller.dob.text = strDate!.format();
                          Get.back();
                        },
                        selectedDay: controller.selectedDate(),
                      ),
                    );
                  },
                  icon: Icon(Icons.calendar_today_rounded),
                ),
              ),
              AppDropdown(
                title: 'Jenis Kelamin',
                hint: 'Pilih Jenis Kelamin',
                data: DummyHelper.genders,
                isRequired: true,
                selected: controller.gender.value,
                callback: (value) {
                  controller.gender.value = value;
                },
              ),
              AppTextField(
                context: context,
                title: 'Alamat Email',
                hint: 'Masukkan Alamat Email',
                isRequired: true,
                readOnly: controller.email.text != '',
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
              ),
              AppTextField(
                context: context,
                title: 'No. HP',
                hint: 'Masukkan No. HP',
                isRequired: true,
                controller: controller.phone,
                keyboardType: TextInputType.phone,
              ),
              AppDropdown(
                title: 'Pendidikan',
                hint: 'Pilih Pendidikan',
                data: DummyHelper.education,
                selected: controller.education.value,
                callback: (value) {
                  controller.education.value = value;
                },
              ),
              AppDropdown(
                title: 'Status Pernikahan',
                hint: 'Pilih Status Pernikahan',
                data: DummyHelper.maritalStatus,
                selected: controller.maritalStatus.value,
                callback: (value) {
                  controller.maritalStatus.value = value;
                },
              ),
              Spacing.vertical(8),
              AppButton.elevatedButton(
                context: context,
                title: 'Selanjutnya',
                callback: () {
                  controller.submitPersonalData(context: context);
                },
              ),
              Spacing.vertical(16),
            ],
          ),
        ),
      ),
    );
  }
}
