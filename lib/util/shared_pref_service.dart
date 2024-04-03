import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/coffee_shop.dart';

class SharedPreferencesService {
  static const String _CoffeeShopsKey = 'vending_machines';

  Future<void> saveCoffeeShops(List<CoffeeShop> CoffeeShops) async {
    final prefs = await SharedPreferences.getInstance();
    final CoffeeShopsJson =
        jsonEncode(CoffeeShops.map((vm) => vm.toJson()).toList());
    await prefs.setString(_CoffeeShopsKey, CoffeeShopsJson);
  }

  Future<List<CoffeeShop>> getCoffeeShops() async {
    final prefs = await SharedPreferences.getInstance();
    final CoffeeShopsJson = prefs.getString(_CoffeeShopsKey);
    if (CoffeeShopsJson != null) {
      final List<dynamic> CoffeeShopsList = jsonDecode(CoffeeShopsJson);
      return CoffeeShopsList.map((json) => CoffeeShop.fromJson(json)).toList();
    }
    return [];
  }
}
