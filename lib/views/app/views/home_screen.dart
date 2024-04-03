import 'package:coffee_biz/views/coffee_shop_screen/views/coffee_shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/app_colors.dart';

import '../../../data/model/news_model.dart';
import '../../news/views/news_screen.dart';
import '../../settings/views/settings_screen.dart';
import '../../statistics_screen/views/statistics_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> homeWidgets = [
    CoffeeShopScreen(),
    StatisticScreen(),
    NewsScreen(
      newsModel: news,
    ),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: homeWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/stock.svg',
              // width: size.height * 0.025,
              height: size.height * 0.032,
              color: currentIndex == 0
                  ? AppColors.peachColor
                  : AppColors.peachColor,
            ),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/portfolio.svg',
              //  width: size.height * 0.025,
              height: size.height * 0.032,
              color: currentIndex == 1
                  ? AppColors.brownColor
                  : AppColors.lightBrownColor,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/news.svg',
                // width: size.height * 0.025,
                height: size.height * 0.032,
                color: currentIndex == 2
                    ? AppColors.brownColor
                    : AppColors.peachColor,
              ),
              label: 'Currency'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                //  width: size.height * 0.025,
                height: size.height * 0.032,
                color: currentIndex == 3
                    ? AppColors.lightBrownColor
                    : AppColors.redColor,
              ),
              label: 'Currency'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.lightBrownColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: AppColors.peachColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
