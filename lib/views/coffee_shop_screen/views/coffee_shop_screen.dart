import 'package:coffee_biz/views/coffee_shop_screen/views/detailed_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/coffee_shop_cubit/coffee_shop_cubit.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/home_screen_text_style.dart';
import '../../../data/model/coffee_shop.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../../constructor/views/basic_info_screen.dart';
import '../widgets/banner_widget.dart';

class CoffeeShopScreen extends StatefulWidget {
  const CoffeeShopScreen({Key? key}) : super(key: key);

  @override
  _CoffeeShopScreenState createState() => _CoffeeShopScreenState();
}

class _CoffeeShopScreenState extends State<CoffeeShopScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: BlocBuilder<CoffeeShopCubit, List<CoffeeShop>>(
            builder: (context, coffeeShopsList) {
              if (coffeeShopsList.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      const IncomeBanner(
                        coffeeShops: [],
                      ),
                      SizedBox(height: size.height * 0.08),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(size.height * 0.012),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: size.height * 0.01),
                                    Text(
                                      'Your Coffee shop',
                                      style: HomeScreenTextStyle.title,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height: size.height * 0.015),
                                    Text(
                                      'You do not have a coffee shop added, to add a coffee shop tap Add Coffee shop button.',
                                      style: HomeScreenTextStyle.bannerTitle,
                                      textAlign: TextAlign.start,
                                    ),
                                    const Spacer(),
                                    ChosenActionButton(
                                      svgAssetPath: 'assets/icons/plus.svg',
                                      text: 'Add Coffee shop',
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const BasicInfoScreen()),
                                        );
                                      },
                                    ),
                                    SizedBox(height: size.height * 0.03),
                                  ]),
                            )),
                      )
                    ],
                  ),
                );
              }

              return Column(
                children: [
                  IncomeBanner(coffeeShops: coffeeShopsList),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Your Coffee shop',
                                style: HomeScreenTextStyle.title,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child:
                                  _buildMachinesList(context, coffeeShopsList),
                            ),
                            ChosenActionButton(
                              text: 'Add Coffee shop',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const BasicInfoScreen()),
                                );
                              },
                            ),
                            SizedBox(height: size.height * 0.03),
                          ]),
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }

  Widget _buildMachinesList(
      BuildContext context, List<CoffeeShop> coffeeShops) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: coffeeShops.length,
        itemBuilder: (context, index) {
          final machine = coffeeShops[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailedInfoScreen(coffeeShop: machine),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.darkGreyColor.withOpacity(0.06),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            machine.name,
                            style: HomeScreenTextStyle.name,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                      ],
                    ),
                    Text(
                      machine.description,
                      style: HomeScreenTextStyle.description,
                    ),
                    SizedBox(height: size.width * 0.02),
                    Container(
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Income',
                              style: HomeScreenTextStyle.description,
                            ),
                            Spacer(),
                            Text(
                              '${machine.calculateIncome().toStringAsFixed(2)}',
                              style: HomeScreenTextStyle.descriptionAmount,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * 0.02),
                    Text(
                      'Goods:',
                      style: HomeScreenTextStyle.description,
                    ),
                    SizedBox(height: size.width * 0.015),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: size.height * 0.08,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.015, horizontal: 5),
                        child: Center(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: machine.products.map((product) {
                              return Container(
                                margin: EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.darkGreyColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Center(
                                    child: Text(
                                      product.name,
                                      style: HomeScreenTextStyle.goods,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
