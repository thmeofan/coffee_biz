import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/app_colors.dart';

import '../../../data/model/news_model.dart';
import '../../coffee_shop_screen/views/coffee_shop_screen.dart';
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
              'assets/icons/coffee_shop.svg',
              height: size.height * 0.045,
              color: currentIndex == 0
                  ? AppColors.darkGreyColor
                  : AppColors.darkGreyColor.withOpacity(0.5),
            ),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/statistics.svg',
              height: size.height * 0.045,
              color: currentIndex == 1
                  ? AppColors.darkGreyColor
                  : AppColors.darkGreyColor.withOpacity(0.5),
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/news.svg',
                height: size.height * 0.045,
                color: currentIndex == 2
                    ? AppColors.darkGreyColor
                    : AppColors.darkGreyColor.withOpacity(0.5),
              ),
              label: 'Currency'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                height: size.height * 0.045,
                color: currentIndex == 3
                    ? AppColors.darkGreyColor
                    : AppColors.darkGreyColor.withOpacity(0.5),
              ),
              label: 'Currency'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
