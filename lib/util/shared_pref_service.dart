import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/coffee_shop.dart';

class SharedPreferencesService {
  static const String _coffeeShopsKey = 'coffee_shop';

  Future<void> saveCoffeeShops(List<CoffeeShop> coffeeShops) async {
    final prefs = await SharedPreferences.getInstance();
    final coffeeShopsJson =
        jsonEncode(coffeeShops.map((vm) => vm.toJson()).toList());
    await prefs.setString(_coffeeShopsKey, coffeeShopsJson);
  }

  Future<List<CoffeeShop>> getCoffeeShops() async {
    final prefs = await SharedPreferences.getInstance();
    final coffeeShopsJson = prefs.getString(_coffeeShopsKey);
    if (coffeeShopsJson != null) {
      final List<dynamic> coffeeShopsList = jsonDecode(coffeeShopsJson);
      return coffeeShopsList.map((json) => CoffeeShop.fromJson(json)).toList();
    }
    return [];
  }
}
