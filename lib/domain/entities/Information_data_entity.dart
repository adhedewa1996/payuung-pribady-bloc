class InformationDataEntity {
  InformationDataEntity({
    this.personalData,
    this.personalAddress,
    this.companyInformation,
  });
  PersonalData? personalData;
  PersonalAddress? personalAddress;
  CompanyInformation? companyInformation;
}

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
  String? fullname;
  String? dob;
  String? gender;
  String? email;
  String? phone;
  String? education;
  String? maritalStatus;
}

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

  String? ktp;
  String? nik;
  String? address;
  String? province;
  String? city;
  String? subdistrict;
  String? urbanVillage;
  String? postalCode;
  bool? addressSameAsKTP;
  // DOMISILI
  String? residenceAddress;
  String? residenceProvince;
  String? residenceCity;
  String? residenceSubdistrict;
  String? residenceUrbanVillage;
  String? residencePostalCode;
}

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

  String? name;
  String? address;
  String? position;
  String? lengthOfWork;
  String? sourceOfIncome;
  String? annualGrossIncome;
  String? bankName;
  String? bankBranch;
  String? accountNumber;
  String? accountHolder;
}
