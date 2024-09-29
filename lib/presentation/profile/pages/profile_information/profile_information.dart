import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';
import 'package:payuung_pribadi_app/core/config/theme/app_colors.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/form/form_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/personal_information/personal_data/personal_data_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/pages/profile_information/widget/stepper.dart';

import 'company_information.dart';
import 'personal_address.dart';
import 'personal_data.dart';

class ProfileInformation extends StatefulWidget {
  const ProfileInformation({super.key});

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.veryLightGrey,
      appBar: AppBar(
        title: Text(
          'Informasi Pribadi',
          style: context.theme().textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () {
            context.read<PersonalDataCubit>().changePage(0);
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.veryLightGrey,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomStepper(
              move: (value) {
                tabController.animateTo(value);
              },
            ),
            Spacing.vertical(16),
            BlocBuilder<PersonalFormCubit, PersonalFormState>(
              builder: (context, state) {
                if (state is FormUpdateState) {
                  return Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        PersonalDataWidget(
                          next: () {
                            context.read<PersonalDataCubit>().changePage(1);
                            tabController.animateTo(1);
                          },
                          personalData: state.informationDataModel?.personalData,
                        ),
                        PersonalAddressWidget(
                          next: () {
                            context.read<PersonalDataCubit>().changePage(2);
                            tabController.animateTo(2);
                          },
                          prev: () {
                            context.read<PersonalDataCubit>().changePage(0);
                            tabController.animateTo(0);
                          },
                          personalAddress: state.informationDataModel?.personalAddress,
                        ),
                        CompanyInformationWidget(
                          prev: () {
                            context.read<PersonalDataCubit>().changePage(1);
                            tabController.animateTo(1);
                          },
                          companyInformation: state.informationDataModel?.companyInformation,
                        ),
                      ],
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
