import 'package:coffee_biz/views/app/widgets/output_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/home_screen_text_style.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../../data/model/coffee_shop.dart';

class DetailedInfoScreen extends StatefulWidget {
  final CoffeeShop coffeeShop;
  const DetailedInfoScreen({Key? key, required this.coffeeShop})
      : super(key: key);

  @override
  _DetailedInfoScreenState createState() => _DetailedInfoScreenState();
}

class _DetailedInfoScreenState extends State<DetailedInfoScreen> {
  bool _showMachines = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: -5,
        title: const Text(
          'Back',
          style: SettingsTextStyle.back,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/leading.svg',
            width: size.width * 0.04,
            height: size.width * 0.04,
            // color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(10.0),
                        selectedColor:
                            AppColors.darkGreyColor.withOpacity(0.06),
                        color: AppColors.darkGreyColor.withOpacity(0.06),
                        fillColor: AppColors.yellowColor,
                        onPressed: (int newIndex) {
                          setState(() {
                            _showMachines = newIndex == 0;
                          });
                        },
                        isSelected: [_showMachines, !_showMachines],
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            child: const Text(
                              'Coffee shop info',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkGreyColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.13),
                            child: Text(
                              'Goods',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkGreyColor.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Expanded(
                      child: _showMachines
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      OutputWidget(
                                        text: widget.coffeeShop.name,
                                        textStyle: HomeScreenTextStyle.detail,
                                      ),
                                      OutputWidget(
                                        text: widget.coffeeShop.description,
                                        textStyle: HomeScreenTextStyle.detail,
                                      ),
                                      OutputWidget(
                                        actions: [
                                          Text(
                                            '${widget.coffeeShop.calculateIncome().toStringAsFixed(2)}',
                                            style: HomeScreenTextStyle
                                                .descriptionAmount,
                                          ),
                                          SizedBox(width: size.width * 0.0175),
                                        ],
                                        textStyle:
                                            HomeScreenTextStyle.description,
                                        text: 'Income: ',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : _buildProductsList(
                              context, widget.coffeeShop.products),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsList(BuildContext context, List<Product> productsList) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        final product = productsList[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.darkGreyColor.withOpacity(0.06),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        product.name,
                        style: HomeScreenTextStyle.name,
                      ),
                      SizedBox(width: size.width * 0.03),
                    ],
                  ),
                  SizedBox(height: size.width * 0.03),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(0.15),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'Revenues of goods ',
                            style: HomeScreenTextStyle.description,
                          ),
                          Spacer(),
                          Text(
                            '${product.price * double.parse(product.consumption)}',
                            style: HomeScreenTextStyle.descriptionAmount,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * 0.02),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.43,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Quantity',
                                style: HomeScreenTextStyle.description,
                              ),
                              Text(
                                '${product.consumption}',
                                style: HomeScreenTextStyle.descriptionAmount,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: size.width * 0.43,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Price per piece',
                                style: HomeScreenTextStyle.description,
                              ),
                              Text(
                                '${product.price}',
                                style: HomeScreenTextStyle.descriptionAmount,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Refill every',
                        style: HomeScreenTextStyle.description,
                      ),
                      Spacer(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.darkGreyColor,
                        ),
                        child: Text(
                          product.consumptionPeriod == ConsumptionPeriod.weekly
                              ? 'Week'
                              : 'Month',
                          style: HomeScreenTextStyle.goods,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
