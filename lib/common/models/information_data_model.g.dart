// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InformationDataModelAdapter extends TypeAdapter<InformationDataModel> {
  @override
  final int typeId = 0;

  @override
  InformationDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InformationDataModel(
      personalData: fields[0] as PersonalData?,
      personalAddress: fields[1] as PersonalAddress?,
      companyInformation: fields[2] as CompanyInformation?,
    );
  }

  @override
  void write(BinaryWriter writer, InformationDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.personalData)
      ..writeByte(1)
      ..write(obj.personalAddress)
      ..writeByte(2)
      ..write(obj.companyInformation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InformationDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PersonalDataAdapter extends TypeAdapter<PersonalData> {
  @override
  final int typeId = 1;

  @override
  PersonalData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalData(
      fullname: fields[0] as String?,
      dob: fields[1] as String?,
      gender: fields[2] as String?,
      email: fields[3] as String?,
      phone: fields[4] as String?,
      education: fields[5] as String?,
      maritalStatus: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.fullname)
      ..writeByte(1)
      ..write(obj.dob)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.education)
      ..writeByte(6)
      ..write(obj.maritalStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PersonalAddressAdapter extends TypeAdapter<PersonalAddress> {
  @override
  final int typeId = 2;

  @override
  PersonalAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalAddress(
      ktp: fields[0] as String?,
      nik: fields[1] as String?,
      address: fields[2] as String?,
      province: fields[3] as String?,
      city: fields[4] as String?,
      subdistrict: fields[5] as String?,
      urbanVillage: fields[6] as String?,
      postalCode: fields[7] as String?,
      addressSameAsKTP: fields[8] as bool?,
      residenceAddress: fields[9] as String?,
      residenceCity: fields[11] as String?,
      residencePostalCode: fields[14] as String?,
      residenceProvince: fields[10] as String?,
      residenceSubdistrict: fields[12] as String?,
      residenceUrbanVillage: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalAddress obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.ktp)
      ..writeByte(1)
      ..write(obj.nik)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.province)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.subdistrict)
      ..writeByte(6)
      ..write(obj.urbanVillage)
      ..writeByte(7)
      ..write(obj.postalCode)
      ..writeByte(8)
      ..write(obj.addressSameAsKTP)
      ..writeByte(9)
      ..write(obj.residenceAddress)
      ..writeByte(10)
      ..write(obj.residenceProvince)
      ..writeByte(11)
      ..write(obj.residenceCity)
      ..writeByte(12)
      ..write(obj.residenceSubdistrict)
      ..writeByte(13)
      ..write(obj.residenceUrbanVillage)
      ..writeByte(14)
      ..write(obj.residencePostalCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompanyInformationAdapter extends TypeAdapter<CompanyInformation> {
  @override
  final int typeId = 3;

  @override
  CompanyInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyInformation(
      name: fields[0] as String?,
      address: fields[1] as String?,
      position: fields[2] as String?,
      lengthOfWork: fields[3] as String?,
      sourceOfIncome: fields[4] as String?,
      annualGrossIncome: fields[5] as String?,
      bankName: fields[6] as String?,
      bankBranch: fields[7] as String?,
      accountNumber: fields[8] as String?,
      accountHolder: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyInformation obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.position)
      ..writeByte(3)
      ..write(obj.lengthOfWork)
      ..writeByte(4)
      ..write(obj.sourceOfIncome)
      ..writeByte(5)
      ..write(obj.annualGrossIncome)
      ..writeByte(6)
      ..write(obj.bankName)
      ..writeByte(7)
      ..write(obj.bankBranch)
      ..writeByte(8)
      ..write(obj.accountNumber)
      ..writeByte(9)
      ..write(obj.accountHolder);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
