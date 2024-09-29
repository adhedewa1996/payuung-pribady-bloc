import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payuung_pribadi_app/common/helpers/date_extensions.dart';
import 'package:payuung_pribadi_app/common/helpers/dummy_helper.dart';
import 'package:payuung_pribadi_app/common/helpers/string_extensions.dart';
import 'package:payuung_pribadi_app/common/models/information_data_model.dart';
import 'package:payuung_pribadi_app/common/widgets/buttons.dart';
import 'package:payuung_pribadi_app/common/widgets/datepicker/calendar_bottomsheet.dart';
import 'package:payuung_pribadi_app/common/widgets/datepicker/datepicker_widget.dart';
import 'package:payuung_pribadi_app/common/widgets/dropdown/dropdown.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';
import 'package:payuung_pribadi_app/common/widgets/textfield.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/form/form_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/personal_information/personal_data/personal_data_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/profile/profile_cubit.dart';

class PersonalDataWidget extends StatefulWidget {
  const PersonalDataWidget({
    super.key,
    required this.next,
    required this.personalData,
  });

  final Function() next;
  final PersonalData? personalData;

  @override
  State<PersonalDataWidget> createState() => _PersonalDataWidgetState();
}

class _PersonalDataWidgetState extends State<PersonalDataWidget> {
  GlobalKey<FormState>? personalDataFormKey = GlobalKey<FormState>();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  String? _gender;
  String? _education;
  String? _maritalStatus;

  void updateGender(String value) {
    _gender = value;
    log(value);
    setState(() {});
  }

  void updateEducation(String value) {
    _education = value;
    setState(() {});
  }

  void updateMaritalStatus(String value) {
    _maritalStatus = value;
    setState(() {});
  }

  void updateBirthDay(String value) {
    _dob.text = value;
    setState(() {});
  }

  @override
  void initState() {
    inspect(widget.personalData);
    final data = widget.personalData;
    _fullname.text = data?.fullname ?? '';
    _dob.text = data?.dob ?? '';
    _email.text = data?.email ?? '';
    _phone.text = data?.phone ?? '';
    _gender = data?.gender;
    _education = data?.education;
    _maritalStatus = data?.maritalStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _body(context: context);
  }

  Widget _body({
    required BuildContext context,
  }) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Form(
        key: personalDataFormKey,
        child: Column(
          children: [
            AppTextField(
              context: context,
              title: 'Nama Lengkap',
              hint: 'Masukkan Nama Lengkap',
              isRequired: true,
              controller: _fullname,
            ),
            AppTextField(
              context: context,
              title: 'Tanggal',
              hint: 'Pilih Tanggal Lahir',
              isRequired: true,
              readOnly: true,
              controller: _dob,
              suffixIcon: IconButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  await Future.delayed(const Duration(milliseconds: 250));
                  CalendarBottomSheet.show(
                    context: context,
                    child: DatePickerWidget(
                      onCancel: () {
                        Navigator.pop(context);
                      },
                      onSetDate: (strDate) {
                        updateBirthDay(strDate!.format());
                        Navigator.pop(context);
                      },
                      selectedDay: DateTime.now(),
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
              selected: _gender,
              callback: (value) {
                updateGender(value);
              },
            ),
            AppTextField(
              context: context,
              title: 'Alamat Email',
              hint: 'Masukkan Alamat Email',
              isRequired: true,
              readOnly: _email.text != '',
              controller: _email,
              keyboardType: TextInputType.emailAddress,
            ),
            AppTextField(
              context: context,
              title: 'No. HP',
              hint: 'Masukkan No. HP',
              isRequired: true,
              controller: _phone,
              keyboardType: TextInputType.phone,
            ),
            AppDropdown(
              title: 'Pendidikan',
              hint: 'Pilih Pendidikan',
              data: DummyHelper.education,
              selected: _education,
              callback: (value) {
                updateEducation(value);
              },
            ),
            AppDropdown(
              title: 'Status Pernikahan',
              hint: 'Pilih Status Pernikahan',
              data: DummyHelper.maritalStatus,
              selected: _maritalStatus,
              callback: (value) {
                updateMaritalStatus(value);
              },
            ),
            Spacing.vertical(8),
            AppButton.elevatedButton(
              context: context,
              title: 'Selanjutnya',
              callback: () {
                final x = PersonalData(
                  fullname: _fullname.text,
                  dob: _dob.text,
                  email: _email.text,
                  phone: _phone.text,
                  gender: _gender,
                  education: _education,
                  maritalStatus: _maritalStatus,
                );
                if (personalDataFormKey?.currentState?.validate() ?? false) {
                  context.read<PersonalFormCubit>().updatePersonalData(data: x);
                  context.read<PersonalDataCubit>().changePage(1);
                  context.read<ProfileCubit>().init();
                  widget.next.call();
                  'Data Biodata Diri berhasil disimpan'.snackbar(context);
                }
              },
            ),
            Spacing.vertical(16),
          ],
        ),
      ),
    );
  }
}
