import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/coffee_shop.dart';
import '../../util/shared_pref_service.dart';

class CoffeeShopCubit extends Cubit<List<CoffeeShop>> {
  final SharedPreferencesService _sharedPreferencesService;

  CoffeeShopCubit(this._sharedPreferencesService) : super([]) {
    _loadCoffeeShops();
  }

  void _loadCoffeeShops() async {
    final coffeeShops = await _sharedPreferencesService.getCoffeeShops();
    emit(coffeeShops);
  }

  void addCoffeeShop(CoffeeShop coffeeShop) async {
    final List<CoffeeShop> updatedList = List.from(state)..add(coffeeShop);
    emit(updatedList);
    await _sharedPreferencesService.saveCoffeeShops(updatedList);
  }

  void updateCoffeeShopsList(List<CoffeeShop> updatedList) async {
    emit(updatedList);
    await _sharedPreferencesService.saveCoffeeShops(updatedList);
  }
}
