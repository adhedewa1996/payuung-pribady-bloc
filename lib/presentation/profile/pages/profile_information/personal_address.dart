import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/helpers/dummy_helper.dart';
import 'package:payuung_pribadi_app/common/helpers/string_extensions.dart';
import 'package:payuung_pribadi_app/common/models/information_data_model.dart';
import 'package:payuung_pribadi_app/common/widgets/bottom_sheet.dart';
import 'package:payuung_pribadi_app/common/widgets/buttons.dart';
import 'package:payuung_pribadi_app/common/widgets/dropdown/dropdown.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';
import 'package:payuung_pribadi_app/common/widgets/textfield.dart';
import 'package:payuung_pribadi_app/core/config/assets/app_vectors.dart';
import 'package:payuung_pribadi_app/data/repo/personal_information_database_repo.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/form/form_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/personal_information/personal_data/personal_data_cubit.dart';

class PersonalAddressWidget extends StatefulWidget {
  const PersonalAddressWidget({
    super.key,
    required this.next,
    required this.prev,
    required this.personalAddress,
  });

  final Function() next;
  final Function() prev;
  final PersonalAddress? personalAddress;

  @override
  State<PersonalAddressWidget> createState() => _PersonalAddressWidgetState();
}

class _PersonalAddressWidgetState extends State<PersonalAddressWidget> {
  final personalAddressFormKey = GlobalKey<FormState>();
  final TextEditingController _nik = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  String? _ktp;
  String? _province;
  String? _city;
  String? _subdistrict;
  String? _urbanVillage;
  bool? _addressSameAsKTP;
  // DOMISILI
  final TextEditingController _residenceAddress = TextEditingController();
  final TextEditingController _residencePostalCode = TextEditingController();
  String? _residenceProvince;
  String? _residenceCity;
  String? _residenceSubdistrict;
  String? _residenceUrbanVillage;

  @override
  void initState() {
    final data = widget.personalAddress;
    _nik.text = data?.nik ?? '';
    _address.text = data?.address ?? '';
    _postalCode.text = data?.postalCode ?? '';
    _ktp = data?.ktp;
    _province = data?.province;
    _city = data?.city;
    _subdistrict = data?.subdistrict;
    _urbanVillage = data?.urbanVillage;
    _addressSameAsKTP = data?.addressSameAsKTP;
    // DOMISILI
    _residenceAddress.text = data?.residenceAddress ?? '';
    _residencePostalCode.text = data?.residencePostalCode ?? '';
    _residenceProvince = data?.residenceProvince;
    _residenceCity = data?.residenceCity;
    _residenceSubdistrict = data?.residenceSubdistrict;
    _residenceUrbanVillage = data?.residenceUrbanVillage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _body(context: context);
  }

  void updateKTP(String value) {
    _ktp = value;
    setState(() {});
  }

  void updateProvince(String value) {
    _province = value;
    setState(() {});
  }

  void updateCity(String value) {
    _city = value;
    setState(() {});
  }

  void updateSubdistrict(String value) {
    _subdistrict = value;
    setState(() {});
  }

  void updateUrbanVillage(String value) {
    _urbanVillage = value;
    setState(() {});
  }

  // DOMISILI
  void updateResidenceProvince(String value) {
    _residenceProvince = value;
    setState(() {});
  }

  void updateResidenceCity(String value) {
    _residenceCity = value;
    setState(() {});
  }

  void updateResidenceSubdistrict(String value) {
    _residenceSubdistrict = value;
    setState(() {});
  }

  void updateResidenceUrbanVillage(String value) {
    _residenceUrbanVillage = value;
    setState(() {});
  }

  void updateAddressSameAsKTP(bool value) {
    _addressSameAsKTP = value;
    setState(() {});
  }

  Widget _body({
    required BuildContext context,
  }) {
    return SingleChildScrollView(
      child: Form(
        key: personalAddressFormKey,
        child: Column(
          children: [
            _uploadKTP(context: context),
            Spacing.vertical(12),
            AppTextField(
              context: context,
              title: 'Alamat Sesuai KTP',
              hint: 'Masukkan Alamat',
              isRequired: true,
              controller: _address,
            ),
            AppDropdown(
              title: 'Provinsi',
              hint: 'Pilih Provinsi',
              data: DummyHelper.provinces,
              isRequired: true,
              selected: _province,
              callback: (value) {
                updateProvince(value);
              },
            ),
            AppDropdown(
              title: 'Kota/Kabupaten',
              hint: 'Pilih Kota/Kabupaten',
              data: DummyHelper.cities,
              isRequired: true,
              enable: _province != '',
              selected: _city,
              callback: (value) {
                updateCity(value);
              },
            ),
            AppDropdown(
              title: 'Kecamatan',
              hint: 'Pilih Kecamatan',
              data: DummyHelper.subdistricts,
              isRequired: true,
              enable: _city != '',
              selected: _subdistrict,
              callback: (value) {
                updateSubdistrict(value);
              },
            ),
            AppDropdown(
              title: 'Kelurahan',
              hint: 'Pilih Kelurahan',
              data: DummyHelper.urbanVillage,
              isRequired: true,
              enable: _subdistrict != '',
              selected: _urbanVillage,
              callback: (value) {
                updateUrbanVillage(value);
              },
            ),
            AppTextField(
              context: context,
              title: 'Kode Pos',
              hint: 'Masukkan Kode Pos',
              isRequired: true,
              controller: _postalCode,
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
                    textColor: context.theme().primaryColor,
                    callback: () {
                      widget.prev.call();
                    },
                  ),
                ),
                Spacing.horizontal(12),
                Expanded(
                  child: AppButton.elevatedButton(
                    context: context,
                    title: 'Selanjutnya',
                    callback: () {
                      if (personalAddressFormKey.currentState?.validate() ?? false) {
                        final x = PersonalAddress(
                          ktp: _ktp,
                          nik: _nik.text,
                          address: _address.text,
                          province: _province,
                          city: _city,
                          subdistrict: _subdistrict,
                          urbanVillage: _urbanVillage,
                          postalCode: _postalCode.text,
                          addressSameAsKTP: _addressSameAsKTP,
                          residenceAddress: _residenceAddress.text,
                          residenceCity: _residenceCity,
                          residencePostalCode: _residencePostalCode.text,
                          residenceProvince: _residenceProvince,
                          residenceSubdistrict: _residenceSubdistrict,
                          residenceUrbanVillage: _residenceUrbanVillage,
                        );
                        context.read<PersonalFormCubit>().updatePersonalAddress(data: x);
                        widget.next.call();
                        'Data Alamat Pribadi berhasil disimpan'.snackbar(context);
                      }
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

  Widget domisili({
    required BuildContext context,
  }) {
    return Column(
      children: [
        AppTextField(
          context: context,
          title: 'Alamat Sesuai KTP',
          hint: 'Masukkan Alamat',
          isRequired: true,
          controller: _residenceAddress,
        ),
        AppDropdown(
          title: 'Provinsi',
          hint: 'Pilih Provinsi',
          data: DummyHelper.provinces,
          isRequired: true,
          selected: _residenceProvince,
          callback: (value) {
            updateResidenceProvince(value);
          },
        ),
        AppDropdown(
          title: 'Kota/Kabupaten',
          hint: 'Pilih Kota/Kabupaten',
          data: DummyHelper.cities,
          isRequired: true,
          enable: _residenceProvince != '',
          selected: _residenceCity,
          callback: (value) {
            updateResidenceCity(value);
          },
        ),
        AppDropdown(
          title: 'Kecamatan',
          hint: 'Pilih Kecamatan',
          data: DummyHelper.subdistricts,
          isRequired: true,
          enable: _residenceCity != '',
          selected: _residenceSubdistrict,
          callback: (value) {
            updateResidenceSubdistrict(value);
          },
        ),
        AppDropdown(
          title: 'Kelurahan',
          hint: 'Pilih Kelurahan',
          data: DummyHelper.urbanVillage,
          isRequired: true,
          enable: _residenceSubdistrict != '',
          selected: _residenceUrbanVillage,
          callback: (value) {
            updateResidenceUrbanVillage(value);
          },
        ),
        AppTextField(
          context: context,
          title: 'Kode Pos',
          hint: 'Masukkan Kode Pos',
          isRequired: true,
          controller: _residencePostalCode,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _checkbox({
    required BuildContext context,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: _addressSameAsKTP ?? false,
              onChanged: (x) {
                updateAddressSameAsKTP(x ?? false);
              },
            ),
            Spacing.horizontal(12),
            Text('Alamat domisili sama dengan alamat KTP.', style: context.theme().textTheme.titleMedium),
          ],
        ),
        Spacing.vertical(8),
        if (!(_addressSameAsKTP ?? false))
          domisili(
            context: context,
          ),
      ],
    );
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
                  context.read<PersonalFormCubit>().buildInCamera(
                        context: context,
                        callback: (value) {
                          updateKTP(value);
                        },
                      );
                },
                gallery: () {
                  context.read<PersonalFormCubit>().cameraRoll(
                        context: context,
                        callback: (value) {
                          updateKTP(value);
                        },
                      );
                },
                context: context,
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.theme().primaryColor.withOpacity(0.2),
                  ),
                  child: SvgPicture.asset(
                    AppVector.creditCard,
                    width: 35,
                    height: 35,
                    color: context.theme().primaryColor,
                  ),
                ),
                Spacing.horizontal(16),
                SizedBox(
                  width: context.width() * .65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Upload KTP', style: context.theme().textTheme.titleLarge),
                          SizedBox(
                            width: context.width() * .45,
                            child: FutureBuilder<String>(
                              future: PersonalInformationRepo().getFilePath(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text((_ktp ?? '').replaceAll('${snapshot.data}/', ''), style: context.theme().textTheme.titleSmall);
                                }
                                return SizedBox();
                              },
                            ),
                          ),
                        ],
                      ),
                      if (_ktp != '' && _ktp != null)
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                        ),
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
            controller: _nik,
            keyboardType: TextInputType.number,
          ),
          Spacing.vertical(8),
        ],
      ),
    );
  }
}
