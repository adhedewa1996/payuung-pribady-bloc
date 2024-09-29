import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:payuung_pribadi_app/common/models/information_data_model.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileSuccessState());

  Future<void> init() async {
    try {
      final data = Hive.box<InformationDataModel>('PersonalInformationModel').values.toList();
      if (data.isEmpty) {
        emit(
          ProfileSuccessState(
            informationDataModel: InformationDataModel(),
          ),
        );
      } else {
        emit(
          ProfileSuccessState(
            informationDataModel: data.first,
          ),
        );
      }
    } catch (e) {}
  }
}
