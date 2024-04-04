import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../blocs/coffee_shop_cubit/coffee_shop_cubit.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../../data/model/coffee_shop.dart';
import '../../app/views/home_screen.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../../app/widgets/input_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _consumptionController = TextEditingController();
  ConsumptionPeriod _consumptionPeriod = ConsumptionPeriod.weekly;

  bool _validateAndSaveProduct() {
    final String name = _nameController.text;
    final String priceString = _priceController.text;
    final String consumption = _consumptionController.text;

    if (name.isEmpty || priceString.isEmpty || consumption.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill in all fields before adding the product.',
            style: ConstructorTextStyle.snackBar,
          ),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }

    double? price = double.tryParse(priceString);
    if (price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter a valid price.',
            style: ConstructorTextStyle.snackBar,
          ),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }

    final product = Product(
      name: name,
      price: price,
      consumption: consumption,
      consumptionPeriod: _consumptionPeriod,
    );

    List<CoffeeShop> CoffeeShopsList = context.read<CoffeeShopCubit>().state;
    int CoffeeShopIndex = CoffeeShopsList.length - 1;
    CoffeeShop updatedCoffeeShop = CoffeeShopsList[CoffeeShopIndex].copyWith(
      products: [...CoffeeShopsList[CoffeeShopIndex].products, product],
    );
    CoffeeShopsList[CoffeeShopIndex] = updatedCoffeeShop;
    context.read<CoffeeShopCubit>().updateCoffeeShopsList(CoffeeShopsList);

    _nameController.clear();
    _priceController.clear();
    _consumptionController.clear();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              InputWidget(
                controller: _nameController,
                labelText: 'Name',
              ),
              const SizedBox(height: 16.0),
              InputWidget(
                controller: _priceController,
                keyboardType: TextInputType.number,
                labelText: 'Price per piece',
              ),
              const SizedBox(height: 16.0),
              InputWidget(
                controller: _consumptionController,
                labelText: 'Quantity',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'How often will you replenish merchandise?',
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child:
                        _buildConsumptionPeriodButton(ConsumptionPeriod.weekly),
                  ),
                  Expanded(
                    child: _buildConsumptionPeriodButton(
                        ConsumptionPeriod.monthly),
                  ),
                ],
              ),
              Spacer(),
              ChosenActionButton(
                onTap: () {
                  if (_validateAndSaveProduct()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Product saved successfully!',
                          style: ConstructorTextStyle.snackBar,
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                text: 'Add product',
              ),
              ChosenActionButton(
                onTap: () {
                  if (_validateAndSaveProduct()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  }
                },
                text: 'Done',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConsumptionPeriodButton(ConsumptionPeriod consumptionPeriod) {
    final isSelected = _consumptionPeriod == consumptionPeriod;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            setState(() {
              _consumptionPeriod = consumptionPeriod;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.yellowColor
                  : AppColors.darkGreyColor.withOpacity(0.06),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(4.0),
            child: Row(
              children: [
                SizedBox(width: size.width * 0.005),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      consumptionPeriod.name.toUpperCase(),
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.darkGreyColor
                            : AppColors.darkGreyColor.withOpacity(0.4),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: size.width * 0.01),
                  ],
                ),
                Spacer(),
                isSelected
                    ? SvgPicture.asset(
                        'assets/icons/check_circle.svg',
                        width: 24,
                        height: 24,
                      )
                    : SvgPicture.asset(
                        'assets/icons/circle.svg',
                        width: 22,
                        height: 22,
                      ),
                SizedBox(width: size.width * 0.005),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
