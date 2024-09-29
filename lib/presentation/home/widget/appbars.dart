import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/helpers/navigation_extention.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/form/form_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/personal_information/personal_data/personal_data_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/profile/profile_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/profile/profile_state.dart';
import 'package:payuung_pribadi_app/presentation/profile/pages/profile.dart';

class HomeAppbar extends StatelessWidget implements PreferredSize {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selamat Siang',
            style: context.theme().textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state.informationDataModel?.personalData?.fullname == null) {
                return SizedBox();
              }
              return Text(
                '${state.informationDataModel?.personalData?.fullname ?? ''}',
                style: context.theme().textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              );
            },
          ),
          Spacing.vertical(8),
        ],
      ),
      actions: [
        Stack(
          children: [
            Align(
              child: Icon(
                Icons.notifications_none_rounded,
                size: 35,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  '0',
                  style: context.theme().textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Spacing.horizontal(16),
        GestureDetector(
          onTap: () {
            // controller.goToProfile();
            Profile().push(context);
          },
          child: Container(
            width: 50,
            height: 50,
            // padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(200),
            ),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    '${state.informationDataModel?.personalData?.fullname ?? 'O'}'.split('').first,
                    style: context.theme().textTheme.titleLarge?.copyWith(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ),
        Spacing.horizontal(16),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 65);

  @override
  Widget get child => Container();
}
