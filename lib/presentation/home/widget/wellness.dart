import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/models/wellness_model.dart';
import 'package:payuung_pribadi_app/common/widgets/dropdown/dropdown.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';
import 'package:payuung_pribadi_app/presentation/home/cubit/wellness_cubit.dart';

final wellnewssFilter = ['Terpopuler', 'A to Z', 'Z to A', 'Harga Terendah', 'Harga Tertinggi'];

class Wellness extends StatelessWidget {
  const Wellness({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WellnessCubit, WellnessState>(
      builder: (context, state) {
        log('state $state');
        return state.when(
          initial: () => SizedBox(),
          loading: () => SizedBox(),
          empty: () => SizedBox(),
          success: (list, selectedFilter) {
            return _exploreWellness(
              context: context,
              title: 'Explore Wellness',
              items: list,
              selected: selectedFilter,
            );
          },
          error: (error) => SizedBox(),
        );
      },
    );
  }

  Widget _filterWellness({
    required BuildContext context,
    required String selected,
  }) {
    return SizedBox(
      width: context.width() * .45,
      height: 100,
      child: AppDropdown(
        title: '',
        hint: '',
        data: wellnewssFilter,
        selected: selected,
        callback: (value) {},
      ),
    );
  }

  Widget _exploreWellness({
    required BuildContext context,
    required String title,
    required List<WellnewssItem> items,
    required String selected,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: context.theme().textTheme.titleLarge,
                  ),
                ),
                _filterWellness(context: context, selected: selected),
              ],
            ),
          ),
          Spacing.vertical(16),
          GridView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1 / 1.25,
            ),
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Image.network(
                      item.image,
                      height: 150,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    item.title,
                    style: context.theme().textTheme.titleMedium,
                  ),
                  Spacing.vertical(16),
                  pricetag(item: item, context: context),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget pricetag({
    required WellnewssItem item,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (item.discount != 0)
          Row(
            children: [
              Text(
                'Rp. ${item.price.toInt()}',
                style: context.theme().textTheme.titleSmall?.copyWith(decoration: TextDecoration.lineThrough),
              ),
              Text(
                ' ${item.discount.toStringAsFixed(0)}% OFF',
                style: context.theme().textTheme.titleSmall?.copyWith(color: Colors.red),
              ),
            ],
          ),
        Text(
          'Rp. ${item.finalPrice.toInt()}',
          style: context.theme().textTheme.titleMedium,
        ),
      ],
    );
  }
}
