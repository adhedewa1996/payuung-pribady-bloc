import 'dart:developer';

import 'package:payuung_pribadi_app/app/commons/helper/string_extensions.dart';
import 'package:payuung_pribadi_app/app/commons/models/information_data_model.dart';

extension InformationDataHelper on InformationDataModel {
  bool isPersonalDataValid() {
    inspect(this);
    var validToContine = false;
    final validFullname = personalData?.fullname?.valid() ?? false;
    final validDob = personalData?.dob?.valid() ?? false;
    final validGender = personalData?.gender?.valid() ?? false;
    final validEmail = personalData?.email?.valid() ?? false;
    final validPhone = personalData?.phone?.valid() ?? false;
    if (validFullname && validDob && validGender && validEmail && validPhone) {
      validToContine = true;
    } else {
      validToContine = false;
    }

    return validToContine;
  }

  bool isPersonalAddressValid() {
    var validToContine = false;
    inspect(this);
    final validKtp = personalAddress?.ktp?.valid() ?? false;
    final validNik = personalAddress?.nik?.valid() ?? false;
    final validProvince = personalAddress?.province?.valid() ?? false;
    final validCity = personalAddress?.city?.valid() ?? false;
    final validSubdistrict = personalAddress?.subdistrict?.valid() ?? false;
    final validUrbanVillage = personalAddress?.urbanVillage?.valid() ?? false;
    final validPostalCode = personalAddress?.postalCode?.valid() ?? false;
    if (validKtp && validNik && validProvince && validCity && validSubdistrict && validUrbanVillage && validPostalCode) {
      validToContine = true;
    } else {
      validToContine = false;
    }

    return validToContine;
  }
}
