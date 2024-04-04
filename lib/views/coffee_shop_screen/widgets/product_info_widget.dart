import 'package:flutter/material.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../consts/app_text_styles/home_screen_text_style.dart';
import '../../../data/model/coffee_shop.dart';

class ProductInfoWidget extends StatelessWidget {
  final Product product;
  final CoffeeShop coffeeShop;

  const ProductInfoWidget({
    Key? key,
    required this.product,
    required this.coffeeShop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 0.32,
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white.withOpacity(0.15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.name, style: HomeScreenTextStyle.name),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.greenColor.withOpacity(0.2),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text(
                      ' CoffeeShop.machineTypes.first.name, style: HomeScreenTextStyle.type,'),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.015),
          Container(
              width: double.infinity,
              height: size.height * 0.055,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColors.greenColor.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Price per thing',
                      style: HomeScreenTextStyle.location,
                    ),
                    Spacer(),
                    Text(
                      product.price.toString(),
                    )
                  ],
                ),
              )),
          SizedBox(height: size.height * 0.015),
          Row(
            children: [
              Container(
                height: size.height * 0.13,
                width: size.width * 0.38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white.withOpacity(0.15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'goods:',
                        style: ConstructorTextStyle.inputText,
                      ),
                      SizedBox(
                        height: size.height * 0.045,
                      ),
                      Text('${_calculateRenewDate()}',
                          style: HomeScreenTextStyle.goods)
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white.withOpacity(0.15),
                ),
                height: size.height * 0.13,
                width: size.width * 0.38,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Consumption',
                        style: ConstructorTextStyle.inputText,
                      ),
                      SizedBox(
                        height: size.height * 0.045,
                      ),
                      Text(
                        ' ${product.consumption}/week',
                        style: HomeScreenTextStyle.goods,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _calculateRenewDate() {
    DateTime currentDate = DateTime.now();
    int daysToAdd = 0;
    switch (product.consumptionPeriod) {
      case ConsumptionPeriod.weekly:
        daysToAdd = 7;
        break;
      case ConsumptionPeriod.monthly:
        daysToAdd = 30;
        break;
    }
    DateTime renewDate = currentDate.add(Duration(days: daysToAdd));
    return '${renewDate.day}/${renewDate.month}/${renewDate.year}';
  }
}
