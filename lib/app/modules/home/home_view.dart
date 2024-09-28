import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:payuung_pribadi_app/app/commons/models/wellness_model.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/dropdown/dropdown.dart';
import 'package:payuung_pribadi_app/app/commons/widgets/spacing.dart';
import 'package:payuung_pribadi_app/app/core/config/theme/app_colors.dart';
import 'package:payuung_pribadi_app/app/modules/home/home_controller.dart';
import 'package:payuung_pribadi_app/app/modules/home/widget/appbars.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: AppColors.white,
              appBar: HomeAppbar(controller: controller),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Stack(
                      children: [
                        Container(
                          width: Get.width,
                          height: Get.height,
                          color: context.theme.primaryColor,
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: Column(
                            children: [
                              _tabbar(context),
                              _section(
                                context: context,
                                title: 'Produk Keuangan',
                                child: _financialProducts(context),
                              ),
                              _section(
                                context: context,
                                title: 'Kategori Pilihan',
                                child: _selectedCategory(context),
                                rightWidget: _wishlist(context),
                              ),
                              _exploreWellness(
                                context: context,
                                title: 'Explore Wellness',
                              ),
                              Spacing.vertical(Get.height * .125),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // BottomNavigation(),
          ],
        );
      },
    );
  }

  Widget _tabbar(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.veryLightGrey,
        border: Border.all(
          color: AppColors.veryLightGrey,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: TabBar(
        controller: controller.tabcontroller,
        unselectedLabelColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: context.theme.primaryColor, fontWeight: FontWeight.w600),
        labelStyle: TextStyle(color: context.theme.primaryColor, fontWeight: FontWeight.w600),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: context.theme.primaryColor,
        ),
        dividerHeight: 0,
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: EdgeInsets.symmetric(vertical: 10),
        tabs: const [
          Text('Payuung Pribadi'),
          Text('Payuung Krayawan'),
        ],
      ),
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
                style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
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

  Widget _wishlist(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.veryLightGrey,
        borderRadius: BorderRadius.circular(200),
      ),
      child: Row(
        children: [
          Spacing.horizontal(4),
          Text(
            'Wishlist',
            style: context.textTheme.titleMedium,
          ),
          Spacing.horizontal(4),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(200),
            ),
            child: Text(
              '0',
              style: context.textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterWellness(BuildContext context) {
    return SizedBox(
      width: Get.width * .45,
      height: 100,
      child: AppDropdown(
        title: '',
        hint: '',
        data: controller.wellnewssFilter,
        selected: controller.selectedWellnessFilter.value,
        callback: (value) {},
      ),
    );
  }

  Widget _financialProducts(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: controller.financialProducts.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = controller.financialProducts[index];
        return _item(item, context);
      },
    );
  }

  Widget _selectedCategory(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: controller.selectedCategory.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = controller.selectedCategory[index];
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
                    child: Text('NEW', style: context.textTheme.titleSmall?.copyWith(color: Colors.white)),
                  ),
                ),
            ],
          ),
          Spacing.vertical(4),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _exploreWellness({
    required BuildContext context,
    required String title,
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
                    style: context.textTheme.titleLarge,
                  ),
                ),
                _filterWellness(context),
              ],
            ),
          ),
          Spacing.vertical(16),
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.wellnewss.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1 / 1.25,
            ),
            itemBuilder: (BuildContext context, int index) {
              final item = controller.wellnewss[index];
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
                    style: context.textTheme.titleMedium,
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
                style: context.textTheme.titleSmall?.copyWith(decoration: TextDecoration.lineThrough),
              ),
              Text(
                ' ${item.discount.toStringAsFixed(0)}% OFF',
                style: context.textTheme.titleSmall?.copyWith(color: Colors.red),
              ),
            ],
          ),
        Text(
          'Rp. ${item.finalPrice.toInt()}',
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }
}
