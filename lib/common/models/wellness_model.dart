import 'package:hive/hive.dart';

part 'wellness_model.g.dart';

@HiveType(typeId: 4)
class WellnewssItem {
  WellnewssItem({
    required this.image,
    required this.title,
    required this.price,
    required this.finalPrice,
    this.discount = 0,
    this.isDiscountApplyed = false,
  });

  @HiveField(0)
  final String image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final double finalPrice;
  @HiveField(4)
  final double discount;
  @HiveField(5)
  final bool isDiscountApplyed;
}
