import 'package:coffee_biz/util/app_routes.dart';
import 'package:coffee_biz/util/shared_pref_service.dart';
import 'package:coffee_biz/views/app/views/screen_new.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/coffee_shop_cubit/coffee_shop_cubit.dart';
import 'data/repository/onboarding_repository.dart';
import 'firebase_options.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));

  String privacyPolicyLink = await fetchPrivacyPolicyLink();
  bool isFirstTime = await checkFirstLaunch();

  runApp(BlocProvider(
    create: (context) => CoffeeShopCubit(SharedPreferencesService()),
    child: FutureBuilder(
      future: fetchPrivacyPolicyLink(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            ),
          );
        } else {
          String privacyPolicyLink = snapshot.data ?? '';
          return MyApp(
            isFirstLaunch: isFirstTime,
            privacyPolicyLink: privacyPolicyLink,
          );
        }
      },
    ),
  ));
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<String> fetchPrivacyPolicyLink() async {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  return remoteConfig.getString('fetch');
}

Future<bool> checkFirstLaunch() async {
  bool isFirstTime = await OnboardingRepository().checkFirstTime();

  return isFirstTime;
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.isFirstLaunch,
    required this.privacyPolicyLink,
  }) : super(key: key);

  final bool isFirstLaunch;
  final String privacyPolicyLink;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      onGenerateRoute: (settings) {
        if (privacyPolicyLink.isNotEmpty && privacyPolicyLink != 'haveNoLink') {
          return MaterialPageRoute(builder: (context) => ScreenNew());
        } else {
          return AppRoutes.onGenerateRoute(settings);
        }
      },
      initialRoute: isFirstLaunch ? AppRoutes.welcome : AppRoutes.home,
    );
  }
}
