import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../consts/app_text_styles/onboarding_text_style.dart';
import '../../../util/app_routes.dart';
import '../../app/widgets/chosen_action_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  final bool? isFirstTime;

  const OnboardingScreen({
    Key? key,
    this.isFirstTime,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.transparent.withOpacity(1),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                // Wrap the Column with Expanded
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.45,
                    ),
                    const Text(
                      'Welcome to our app “CoffeeBiz”!',
                      style: OnboardingTextStyle.introduction,
                      textAlign: TextAlign.start,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Explore the best business practices in the coffee industry and move towards success with us. ',
                      style: OnboardingTextStyle.description,
                      textAlign: TextAlign.start,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    Spacer(),
                    ChosenActionButton(
                      onTap: () {
                        context.read<OnboardingCubit>().setFirstTime();
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      },
                      text: 'Get started',
                    ),
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
