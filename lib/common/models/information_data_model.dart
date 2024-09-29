import 'package:hive/hive.dart';
import 'package:payuung_pribadi_app/domain/entities/information_data_entity.dart' as e;

part 'information_data_model.g.dart';

@HiveType(typeId: 0)
class InformationDataModel {
  InformationDataModel({
    this.personalData,
    this.personalAddress,
    this.companyInformation,
  });
  @HiveField(0)
  PersonalData? personalData;
  @HiveField(1)
  PersonalAddress? personalAddress;
  @HiveField(2)
  CompanyInformation? companyInformation;
}

@HiveType(typeId: 1)
class PersonalData {
  PersonalData({
    this.fullname,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.education,
    this.maritalStatus,
  });

  @HiveField(0)
  String? fullname;
  @HiveField(1)
  String? dob;
  @HiveField(2)
  String? gender;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? phone;
  @HiveField(5)
  String? education;
  @HiveField(6)
  String? maritalStatus;

  PersonalData copyWith({
    String? fullname,
    String? dob,
    String? gender,
    String? email,
    String? phone,
    String? education,
    String? maritalStatus,
  }) {
    return PersonalData(
      fullname: fullname ?? this.fullname,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      education: education ?? this.education,
      maritalStatus: maritalStatus ?? this.maritalStatus,
    );
  }
}

@HiveType(typeId: 2)
class PersonalAddress {
  PersonalAddress({
    this.ktp,
    this.nik,
    this.address,
    this.province,
    this.city,
    this.subdistrict,
    this.urbanVillage,
    this.postalCode,
    this.addressSameAsKTP,
    this.residenceAddress,
    this.residenceCity,
    this.residencePostalCode,
    this.residenceProvince,
    this.residenceSubdistrict,
    this.residenceUrbanVillage,
  });
  @HiveField(0)
  String? ktp;
  @HiveField(1)
  String? nik;
  @HiveField(2)
  String? address;
  @HiveField(3)
  String? province;
  @HiveField(4)
  String? city;
  @HiveField(5)
  String? subdistrict;
  @HiveField(6)
  String? urbanVillage;
  @HiveField(7)
  String? postalCode;
  @HiveField(8)
  bool? addressSameAsKTP;
  // DOMISILI
  @HiveField(9)
  String? residenceAddress;
  @HiveField(10)
  String? residenceProvince;
  @HiveField(11)
  String? residenceCity;
  @HiveField(12)
  String? residenceSubdistrict;
  @HiveField(13)
  String? residenceUrbanVillage;
  @HiveField(14)
  String? residencePostalCode;
}

@HiveType(typeId: 3)
class CompanyInformation {
  CompanyInformation({
    this.name,
    this.address,
    this.position,
    this.lengthOfWork,
    this.sourceOfIncome,
    this.annualGrossIncome,
    this.bankName,
    this.bankBranch,
    this.accountNumber,
    this.accountHolder,
  });

  @HiveField(0)
  String? name;
  @HiveField(1)
  String? address;
  @HiveField(2)
  String? position;
  @HiveField(3)
  String? lengthOfWork;
  @HiveField(4)
  String? sourceOfIncome;
  @HiveField(5)
  String? annualGrossIncome;
  @HiveField(6)
  String? bankName;
  @HiveField(7)
  String? bankBranch;
  @HiveField(8)
  String? accountNumber;
  @HiveField(9)
  String? accountHolder;
}

extension InformationDataModelHelper on InformationDataModel {
  e.InformationDataEntity toEntity() {
    final personalDataModel = personalData;
    final personalAddressModel = personalAddress;
    final companyInformationModel = companyInformation;
    return e.InformationDataEntity(
      personalData: e.PersonalData(
        fullname: personalDataModel?.fullname,
        dob: personalDataModel?.dob,
        gender: personalDataModel?.gender,
        email: personalDataModel?.email,
        phone: personalDataModel?.phone,
        education: personalDataModel?.education,
        maritalStatus: personalDataModel?.maritalStatus,
      ),
      personalAddress: e.PersonalAddress(
        ktp: personalAddressModel?.ktp,
        nik: personalAddressModel?.nik,
        address: personalAddressModel?.address,
        province: personalAddressModel?.province,
        city: personalAddressModel?.city,
        subdistrict: personalAddressModel?.subdistrict,
        urbanVillage: personalAddressModel?.urbanVillage,
        postalCode: personalAddressModel?.postalCode,
        addressSameAsKTP: personalAddressModel?.addressSameAsKTP,
        // DOMISILI
        residenceAddress: personalAddressModel?.residenceAddress,
        residenceProvince: personalAddressModel?.residenceProvince,
        residenceCity: personalAddressModel?.residenceCity,
        residenceSubdistrict: personalAddressModel?.residenceSubdistrict,
        residenceUrbanVillage: personalAddressModel?.residenceUrbanVillage,
        residencePostalCode: personalAddressModel?.residencePostalCode,
      ),
      companyInformation: e.CompanyInformation(
        name: companyInformationModel?.name,
        address: companyInformationModel?.address,
        position: companyInformationModel?.position,
        lengthOfWork: companyInformationModel?.lengthOfWork,
        sourceOfIncome: companyInformationModel?.sourceOfIncome,
        annualGrossIncome: companyInformationModel?.annualGrossIncome,
        bankName: companyInformationModel?.bankName,
        bankBranch: companyInformationModel?.bankBranch,
        accountNumber: companyInformationModel?.accountNumber,
        accountHolder: companyInformationModel?.accountHolder,
      ),
    );
  }
}
