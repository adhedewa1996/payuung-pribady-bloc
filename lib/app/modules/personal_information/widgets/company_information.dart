import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/helper/dummy_helper.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/buttons.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/dropdown/dropdown.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/spacing.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/textfield.dart';
import 'package:payuung_pribadi_app/app/modules/personal_information/personal_information_controller.dart';

class CompanyInformationWidget extends StatelessWidget {
  const CompanyInformationWidget({
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
        child: Column(
          children: [
            AppTextField(
              context: context,
              title: 'Nama Usaha/Perusahaan',
              hint: 'Masukkan Nama Usaha/Perusahaan',
              controller: controller.companyName,
            ),
            AppTextField(
              context: context,
              title: 'Alamat',
              hint: 'Masukkan Alamat Usaha/Perusahaan',
              controller: controller.companyAddress,
            ),
            AppDropdown(
              title: 'Jabatan',
              hint: 'Pilih',
              data: DummyHelper.positions,
              selected: controller.position.value,
              callback: (value) {
                controller.position.value = value;
              },
            ),
            AppDropdown(
              title: 'Lama Bekerja',
              hint: 'Pilih',
              data: DummyHelper.lengthOfWork,
              selected: controller.lengthOfWork.value,
              callback: (value) {
                controller.lengthOfWork.value = value;
              },
            ),
            AppDropdown(
              title: 'Sumber Pendapatan',
              hint: 'Pilih',
              data: DummyHelper.sourceOfIncome,
              selected: controller.sourceOfIncome.value,
              callback: (value) {
                controller.sourceOfIncome.value = value;
              },
            ),
            AppDropdown(
              title: 'Pendapatan Kotor Pertahun',
              hint: 'Pilih',
              data: DummyHelper.annualGrossIncome,
              selected: controller.annualGrossIncome.value,
              callback: (value) {
                controller.annualGrossIncome.value = value;
              },
            ),
            AppDropdown(
              title: 'Nama Bank',
              hint: 'Pilih',
              data: DummyHelper.bankName,
              selected: controller.bankName.value,
              callback: (value) {
                controller.bankName.value = value;
              },
            ),
            AppTextField(
              context: context,
              title: 'Cabang Bank',
              hint: 'Masukkan Cabang Bank',
              controller: controller.bankBranch,
            ),
            AppTextField(
              context: context,
              title: 'Nomor rekening',
              hint: 'Masukkan Nomor rekening',
              controller: controller.accountNumber,
              keyboardType: TextInputType.number,
            ),
            AppTextField(
              context: context,
              title: 'Nama Pemilih Rekening',
              hint: 'Masukkan Pemilih Rekening',
              controller: controller.accountHolder,
            ),
            Spacing.vertical(8),
            Row(
              children: [
                Expanded(
                  child: AppButton.outlineButton(
                    context: context,
                    title: 'Sebelumnya',
                    backgroundColor: Colors.white,
                    textColor: context.theme.primaryColor,
                    callback: () {
                      controller.move(value: 1);
                    },
                  ),
                ),
                Spacing.horizontal(12),
                Expanded(
                  child: AppButton.elevatedButton(
                    context: context,
                    title: 'Simpan',
                    callback: () {
                      controller.submitCompanyInformation(context);
                    },
                  ),
                ),
              ],
            ),
            Spacing.vertical(16),
          ],
        ),
      ),
    );
  }
}
