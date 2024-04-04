import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../app/views/my_in_app_web_view.dart';
import '../widgets/ios_toggle.dart';
import '../widgets/settings_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isSwitched = false;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.height * 0.018),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Settings',
                          style: SettingsTextStyle.title,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SettingsTile(
                    assetName: 'assets/icons/share.svg',
                    text: 'Share with friends',
                    action: Row(
                      children: [SvgPicture.asset('assets/icons/arrow.svg')],
                    ),
                  ),
                  SettingsTile(
                    assetName: 'assets/icons/terms.svg',
                    text: 'Terms of use',
                    action: SvgPicture.asset('assets/icons/arrow.svg'),
                  ),
                  SettingsTile(
                    assetName: 'assets/icons/privacy.svg',
                    text: 'Privacy Policy',
                    action: SvgPicture.asset('assets/icons/arrow.svg'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MyScreenForVIew(url: 'https://google.com/'),
                        ),
                      );
                    },
                  ),
                  SettingsTile(
                    assetName: 'assets/icons/notification.svg',
                    text: 'Notification',
                    action: IOSStyleToggle(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
