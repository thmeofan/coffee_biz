import 'package:flutter/material.dart';
import '../../../consts/app_text_styles/home_screen_text_style.dart';
import '../../../data/model/coffee_shop.dart';

class IncomeBanner extends StatelessWidget {
  final List<CoffeeShop> coffeeShops;

  const IncomeBanner({super.key, required this.coffeeShops});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double totalIncome = CoffeeShop.calculateTotalIncome(coffeeShops);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.withOpacity(0.098),
      ),
      width: size.width * 0.95,
      height: size.height * 0.13,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total income',
                style: HomeScreenTextStyle.bannerTitle,
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                '${totalIncome.toStringAsFixed(2)}\$',
                style: HomeScreenTextStyle.bannerAmount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
