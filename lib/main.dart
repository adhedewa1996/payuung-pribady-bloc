import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:payuung_pribadi_app/common/bloc/theme/theme_cubit.dart';
import 'package:payuung_pribadi_app/common/widgets/datepicker/bloc/date_picker_cubit.dart';
import 'package:payuung_pribadi_app/core/config/services/local_storage.dart';
import 'package:payuung_pribadi_app/core/config/theme/theme.dart';
import 'package:payuung_pribadi_app/presentation/dashboard/cubit/bottom_navigation_cubit.dart';
import 'package:payuung_pribadi_app/presentation/dashboard/page/dashboard.dart';
import 'package:payuung_pribadi_app/presentation/home/cubit/wellness_cubit.dart';
import 'package:payuung_pribadi_app/presentation/home/page/homeview.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/form/form_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/personal_information/personal_data/personal_data_cubit.dart';
import 'package:payuung_pribadi_app/presentation/profile/cubit/profile/profile_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageServices.init(); // LOCAL STORAGE

  await FlutterConfig.loadEnvVariables(); // LOAD ENVIRONMENT

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (_) => WellnessCubit()..fetchWellness(),
        ),
        BlocProvider(
          create: (_) => BottomNavigationCubit()..init(),
        ),
        BlocProvider(
          create: (_) => PersonalFormCubit()..init(),
        ),
        BlocProvider(
          create: (_) => DatePickerCubit()..init(),
        ),
        BlocProvider(
          create: (_) => PersonalDataCubit()..init(),
        ),
        BlocProvider(
          create: (_) => ProfileCubit()..init(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: Dashboard(),
        ),
      ),
    );
  }
}
