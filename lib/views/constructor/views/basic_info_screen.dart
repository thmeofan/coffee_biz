import 'package:coffee_biz/views/constructor/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../blocs/coffee_shop_cubit/coffee_shop_cubit.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../../data/model/coffee_shop.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../../app/widgets/input_widget.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({Key? key}) : super(key: key);

  @override
  _BasicInfoScreenState createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _clearControllers() {
    _nameController.clear();
    _locationController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
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
            // color: Colors.white,
          ),
        ),
      ),
      body: Container(
        //  color: AppColors.purpleColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              InputWidget(
                controller: _nameController,
                  labelText: 'Title',
              ),
              const SizedBox(height: 16.0),
              InputWidget(
                controller: _locationController,
                  labelText: 'Description',
              ),
              Spacer(),
              ChosenActionButton(
                text: 'Next',
                onTap: () {
                  if (_nameController.text.isNotEmpty &&
                      _locationController.text.isNotEmpty) {
                    final newCoffeeShop = CoffeeShop(
                      name: _nameController.text,
                      description: _locationController.text,
                      products: [],
                    );
                    context
                        .read<CoffeeShopCubit>()
                        .addCoffeeShop(newCoffeeShop);
                    _clearControllers();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ProductDetailsScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please fill in all the fields before continuing.',
                          style: ConstructorTextStyle.snackBar,
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
