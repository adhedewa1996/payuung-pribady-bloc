import 'package:hive/hive.dart';

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
