import 'package:coffee_biz/consts/app_colors.dart';
import 'package:flutter/material.dart';

class OutputWidget extends StatelessWidget {
  final String text;
  final List<Widget> actions;
  final TextStyle? textStyle;

  const OutputWidget({
    Key? key,
    required this.text,
    this.actions = const [],
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.darkGreyColor.withOpacity(0.06),
        ),
        width: double.infinity,
        height: size.height * 0.075,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: textStyle,
                ),
              ),
            ),
            if (actions.isNotEmpty)
              Row(
                children: actions,
              ),
          ],
        ),
      ),
    );
  }
}
