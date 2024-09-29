import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payuung_pribadi_app/common/helpers/context_entension.dart';
import 'package:payuung_pribadi_app/common/models/menu_item_mode.dart';
import 'package:payuung_pribadi_app/common/widgets/spacing.dart';
import 'package:payuung_pribadi_app/core/config/assets/app_vectors.dart';

final financialProducts = <MenuItem>[
  MenuItem(title: 'Urun', isNew: true, icon: AppVector.banking),
  MenuItem(title: 'Pembiayaan \nPorsi haji', icon: AppVector.coin),
  MenuItem(title: 'Financial \nCheck Up', icon: AppVector.creditCard),
  MenuItem(title: 'Asuransi \nMobil', icon: AppVector.money),
  MenuItem(title: 'Asuransi \nProperti', icon: AppVector.monitor),
];

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return _section(
      context: context,
      title: 'Produk Keuangan',
      child: _financialProducts(context),
    );
  }

  Widget _section({
    required BuildContext context,
    required String title,
    required Widget child,
    Widget? rightWidget,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.vertical(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.theme().textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              rightWidget ?? SizedBox(),
            ],
          ),
          Spacing.vertical(16),
          child,
        ],
      ),
    );
  }

  Widget _financialProducts(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: financialProducts.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = financialProducts[index];
        return _item(item, context);
      },
    );
  }

  Widget _item(MenuItem item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => ExamplePage());
      },
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                child: SvgPicture.asset(
                  item.icon,
                  width: 25,
                  height: 25,
                ),
              ),
              if (item.isNew)
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('NEW', style: context.theme().textTheme.titleSmall?.copyWith(color: Colors.white)),
                  ),
                ),
            ],
          ),
          Spacing.vertical(4),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: context.theme().textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
