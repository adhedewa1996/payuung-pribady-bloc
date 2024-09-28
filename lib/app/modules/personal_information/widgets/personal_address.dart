import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/helper/dummy_helper.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/bottom_sheets.dart/bottom_sheet.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/buttons.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/dropdown/dropdown.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/spacing.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/textfield.dart';
import 'package:payuung_pribadi_app/app/core/config/assets/app_vectors.dart';
import 'package:payuung_pribadi_app/app/data/repo/personal_information_database_repo.dart';
import 'package:payuung_pribadi_app/app/modules/personal_information/personal_information_controller.dart';

class PersonalAddressWidget extends StatelessWidget {
  const PersonalAddressWidget({
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
        child: Form(
          key: controller.personalAddressFormKey,
          child: Column(
            children: [
              _uploadKTP(context: context),
              Spacing.vertical(12),
              AppTextField(
                context: context,
                title: 'Alamat Sesuai KTP',
                hint: 'Masukkan Alamat',
                isRequired: true,
                controller: controller.address,
              ),
              Obx(() {
                return AppDropdown(
                  title: 'Provinsi',
                  hint: 'Pilih Provinsi',
                  data: DummyHelper.provinces,
                  isRequired: true,
                  selected: controller.province.value,
                  callback: (value) {
                    controller.province.value = value;
                  },
                );
              }),
              Obx(() {
                return AppDropdown(
                  title: 'Kota/Kabupaten',
                  hint: 'Pilih Kota/Kabupaten',
                  data: DummyHelper.cities,
                  isRequired: true,
                  enable: controller.province.value != '',
                  selected: controller.city.value,
                  callback: (value) {
                    controller.city.value = value;
                  },
                );
              }),
              Obx(() {
                return AppDropdown(
                  title: 'Kecamatan',
                  hint: 'Pilih Kecamatan',
                  data: DummyHelper.subdistricts,
                  isRequired: true,
                  enable: controller.city.value != '',
                  selected: controller.subdistrict.value,
                  callback: (value) {
                    controller.subdistrict.value = value;
                  },
                );
              }),
              Obx(() {
                return AppDropdown(
                  title: 'Kelurahan',
                  hint: 'Pilih Kelurahan',
                  data: DummyHelper.urbanVillage,
                  isRequired: true,
                  enable: controller.subdistrict.value != '',
                  selected: controller.urbanVillage.value,
                  callback: (value) {
                    controller.urbanVillage.value = value;
                  },
                );
              }),
              AppTextField(
                context: context,
                title: 'Kode Pos',
                hint: 'Masukkan Kode Pos',
                isRequired: true,
                controller: controller.postalCode,
                keyboardType: TextInputType.number,
              ),
              _checkbox(context: context),
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
                        controller.move(value: 0);
                      },
                    ),
                  ),
                  Spacing.horizontal(12),
                  Expanded(
                    child: AppButton.elevatedButton(
                      context: context,
                      title: 'Selanjutnya',
                      callback: () {
                        controller.submitPersonalAddress(context: context);
                      },
                    ),
                  ),
                ],
              ),
              Spacing.vertical(16),
            ],
          ),
        ),
      ),
    );
  }

  Widget domisili(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          context: context,
          title: 'Alamat Sesuai KTP',
          hint: 'Masukkan Alamat',
          isRequired: true,
          controller: controller.residenceAddress,
        ),
        Obx(() {
          return AppDropdown(
            title: 'Provinsi',
            hint: 'Pilih Provinsi',
            data: DummyHelper.provinces,
            isRequired: true,
            selected: controller.residenceProvince.value,
            callback: (value) {
              controller.residenceProvince.value = value;
            },
          );
        }),
        Obx(() {
          return AppDropdown(
            title: 'Kota/Kabupaten',
            hint: 'Pilih Kota/Kabupaten',
            data: DummyHelper.cities,
            isRequired: true,
            enable: controller.residenceProvince.value != '',
            selected: controller.residenceCity.value,
            callback: (value) {
              controller.residenceCity.value = value;
            },
          );
        }),
        Obx(() {
          return AppDropdown(
            title: 'Kecamatan',
            hint: 'Pilih Kecamatan',
            data: DummyHelper.subdistricts,
            isRequired: true,
            enable: controller.residenceCity.value != '',
            selected: controller.residenceSubdistrict.value,
            callback: (value) {
              controller.residenceSubdistrict.value = value;
            },
          );
        }),
        Obx(() {
          return AppDropdown(
            title: 'Kelurahan',
            hint: 'Pilih Kelurahan',
            data: DummyHelper.urbanVillage,
            isRequired: true,
            enable: controller.residenceSubdistrict.value != '',
            selected: controller.residenceUrbanVillage.value,
            callback: (value) {
              controller.residenceUrbanVillage.value = value;
            },
          );
        }),
        AppTextField(
          context: context,
          title: 'Kode Pos',
          hint: 'Masukkan Kode Pos',
          isRequired: true,
          controller: controller.residencePostalCode,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _checkbox({
    required BuildContext context,
  }) {
    return Obx(() {
      return Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: controller.addressSameAsKTP.value,
                onChanged: (x) {
                  controller.addressSameAsKTP.value = x ?? false;
                },
              ),
              Spacing.horizontal(12),
              Text('Alamat domisili sama dengan alamat KTP.', style: context.textTheme.titleMedium),
            ],
          ),
          Spacing.vertical(8),
          if (!controller.addressSameAsKTP.value) domisili(context),
        ],
      );
    });
  }

  Widget _uploadKTP({
    required BuildContext context,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.vertical(8),
          GestureDetector(
            onTap: () {
              imagePicker(
                camera: () {
                  controller.buildInCamera(context);
                },
                gallery: () {
                  controller.cameraRoll(context);
                },
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.theme.primaryColor.withOpacity(0.2),
                  ),
                  child: SvgPicture.asset(
                    AppVector.creditCard,
                    width: 35,
                    height: 35,
                    color: context.theme.primaryColor,
                  ),
                ),
                Spacing.horizontal(16),
                SizedBox(
                  width: Get.width * .65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Upload KTP', style: context.textTheme.titleLarge),
                          SizedBox(
                            width: Get.width * .45,
                            child: FutureBuilder<String>(
                              future: PersonalInformationRepo().getFilePath(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final path = snapshot.data;
                                  return Obx(() {
                                    return Text('${controller.ktp.value.replaceAll('$path/', '')}', style: context.textTheme.titleSmall);
                                  });
                                }
                                return SizedBox();
                              },
                            ),
                          ),
                        ],
                      ),
                      Obx(() {
                        if (controller.ktp.value == '' || controller.ktp.value == null) {
                          return SizedBox();
                        }
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacing.vertical(16),
          AppTextField(
            context: context,
            title: 'NIK',
            hint: 'Masukkan NIK',
            isRequired: true,
            useBottomPadding: false,
            controller: controller.nik,
            keyboardType: TextInputType.number,
          ),
          Spacing.vertical(8),
        ],
      ),
    );
  }
}
