import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payuung_pribadi_app/presentation/dashboard/cubit/bottom_navigation_cubit.dart';
import 'package:payuung_pribadi_app/presentation/dashboard/widget/bottom_navigtion.dart';
import 'package:payuung_pribadi_app/presentation/dashboard/widget/dummy_page.dart';
import 'package:payuung_pribadi_app/presentation/home/page/homeview.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (context, state) {
            return state.when(
              initial: () => SizedBox(),
              loading: () => SizedBox(),
              empty: () => SizedBox(),
              success: (selected) {
                return Scaffold(
                  body: [
                    HomeView(),
                    SearchView(),
                    CartView(),
                    TrasactionView(),
                    MyVoucherView(),
                    ShippingAddressView(),
                    FriendlistView(),
                  ][selected],
                );
              },
              error: (error) => SizedBox(),
            );
          },
        ),
        BottomNavigation(),
      ],
    );
  }
}
