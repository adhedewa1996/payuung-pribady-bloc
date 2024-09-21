import 'package:calculator_camera/app/bloc/arithmetic/arithmetic_list/arithmetic_list_cubit.dart';
import 'package:calculator_camera/app/bloc/theme/theme_cubit.dart';
import 'package:calculator_camera/app/common/models/arithmetic_model.dart';
import 'package:calculator_camera/app/extentions/media_query_ext.dart';
import 'package:calculator_camera/app/page/widgets/home_image.dart';
import 'package:calculator_camera/app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeArithmeticList extends StatefulWidget {
  const HomeArithmeticList({super.key});

  @override
  State<HomeArithmeticList> createState() => _HomeArithmeticListState();
}

class _HomeArithmeticListState extends State<HomeArithmeticList> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<ArithmeticListCubit>().init(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArithmeticListCubit, ArithmeticState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return loading();
          },
          loading: () {
            return loading();
          },
          empty: () {
            return empty();
          },
          success: (items) {
            return list(items: items);
          },
          error: (errorMessage) {
            return Text(errorMessage);
          },
        );
      },
    );
  }

  Widget empty() {
    return SizedBox(
      width: context.sizeHorizontal(),
      height: context.sizeHorizontal(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.air_rounded,
              size: 64,
              color: context.read<ThemeCubit>().state.primaryColor,
            ),
            Spacing.vertical(16),
            Text('EMPTY'),
          ],
        ),
      ),
    );
  }

  Widget loading() {
    return SizedBox(
      width: context.sizeHorizontal(),
      height: context.sizeHorizontal(),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget list({
    required List<ArithmeticModel> items,
  }) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: items.length,
      physics: NeverScrollableScrollPhysics(),
      reverse: true,
      separatorBuilder: (context, index) {
        return Spacing.vertical(16);
      },
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              HomeImage(
                imagePath: item.imagePath,
                width: 50,
                height: 50,
              ),
              Spacing.horizontal(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'input: ${item.inputFromMlKit}',
                  ),
                  Text(
                    'result: ${item.result}',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
