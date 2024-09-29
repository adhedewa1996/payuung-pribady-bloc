import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/helpers/dummy_helper.dart';
import 'package:payuung_pribadi_app/common/helpers/string_extensions.dart';
import 'package:payuung_pribadi_app/common/models/information_data_model.dart';
import 'package:payuung_pribadi_app/common/widgets/buttons.dart';
import 'package:payuung_pribadi_app/common/widgets/dropdown/dropdown.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';
import 'package:payuung_pribadi_app/common/widgets/textfield.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/form/form_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/personal_information/personal_data/personal_data_cubit.dart';

class CompanyInformationWidget extends StatefulWidget {
  CompanyInformationWidget({
    super.key,
    required this.prev,
    required this.companyInformation,
  });

  final Function() prev;
  final CompanyInformation? companyInformation;

  @override
  State<CompanyInformationWidget> createState() => _CompanyInformationWidgetState();
}

class _CompanyInformationWidgetState extends State<CompanyInformationWidget> {
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _companyAddress = TextEditingController();
  final TextEditingController _bankBranch = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _accountHolder = TextEditingController();
  String? _position;
  String? _lengthOfWork;
  String? _sourceOfIncome;
  String? _annualGrossIncome;
  String? _bankName;

  @override
  void initState() {
    final data = widget.companyInformation;
    _companyName.text = data?.name ?? '';
    _companyAddress.text = data?.address ?? '';
    _bankBranch.text = data?.bankBranch ?? '';
    _accountNumber.text = data?.accountNumber ?? '';
    _accountHolder.text = data?.accountHolder ?? '';
    _position = data?.position;
    _lengthOfWork = data?.lengthOfWork;
    _sourceOfIncome = data?.sourceOfIncome;
    _annualGrossIncome = data?.annualGrossIncome;
    _bankName = data?.bankName;
    super.initState();
  }

  void updatePosition(String value) {
    _position = value;
    setState(() {});
  }

  void updateLengthOfWork(String value) {
    _lengthOfWork = value;
    setState(() {});
  }

  void updateSurceOfIncome(String value) {
    _sourceOfIncome = value;
    setState(() {});
  }

  void updateAnnulGrossIncome(String value) {
    _annualGrossIncome = value;
    setState(() {});
  }

  void upateBankName(String value) {
    _bankName = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _body(context: context, data: widget.companyInformation);
  }

  Widget _body({
    required BuildContext context,
    required CompanyInformation? data,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppTextField(
            context: context,
            title: 'Nama Usaha/Perusahaan',
            hint: 'Masukkan Nama Usaha/Perusahaan',
            controller: _companyName,
          ),
          AppTextField(
            context: context,
            title: 'Alamat',
            hint: 'Masukkan Alamat Usaha/Perusahaan',
            controller: _companyAddress,
          ),
          AppDropdown(
            title: 'Jabatan',
            hint: 'Pilih',
            data: DummyHelper.positions,
            selected: _position,
            callback: (value) {
              updatePosition(value);
            },
          ),
          AppDropdown(
            title: 'Lama Bekerja',
            hint: 'Pilih',
            data: DummyHelper.lengthOfWork,
            selected: _lengthOfWork,
            callback: (value) {
              updateLengthOfWork(value);
            },
          ),
          AppDropdown(
            title: 'Sumber Pendapatan',
            hint: 'Pilih',
            data: DummyHelper.sourceOfIncome,
            selected: _sourceOfIncome,
            callback: (value) {
              updateSurceOfIncome(value);
            },
          ),
          AppDropdown(
            title: 'Pendapatan Kotor Pertahun',
            hint: 'Pilih',
            data: DummyHelper.annualGrossIncome,
            selected: _annualGrossIncome,
            callback: (value) {
              updateAnnulGrossIncome(value);
            },
          ),
          AppDropdown(
            title: 'Nama Bank',
            hint: 'Pilih',
            data: DummyHelper.bankName,
            selected: _bankName,
            callback: (value) {
              upateBankName(value);
            },
          ),
          AppTextField(
            context: context,
            title: 'Cabang Bank',
            hint: 'Masukkan Cabang Bank',
            controller: _bankBranch,
          ),
          AppTextField(
            context: context,
            title: 'Nomor rekening',
            hint: 'Masukkan Nomor rekening',
            controller: _accountNumber,
            keyboardType: TextInputType.number,
          ),
          AppTextField(
            context: context,
            title: 'Nama Pemilih Rekening',
            hint: 'Masukkan Pemilih Rekening',
            controller: _accountHolder,
          ),
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
                  title: 'Simpan',
                  callback: () {
                    final x = CompanyInformation(
                      name: _companyName.text,
                      address: _companyAddress.text,
                      position: _position,
                      lengthOfWork: _lengthOfWork,
                      sourceOfIncome: _sourceOfIncome,
                      annualGrossIncome: _annualGrossIncome,
                      bankName: _bankName,
                      bankBranch: _bankBranch.text,
                      accountNumber: _accountNumber.text,
                      accountHolder: _accountHolder.text,
                    );
                    context.read<PersonalFormCubit>().updateCompanyInformation(data: x);
                    'Data Infomasi Perusahaan berhasil disimpan'.snackbar(context);
                  },
                ),
              ),
            ],
          ),
          Spacing.vertical(16),
        ],
      ),
    );
  }
}
