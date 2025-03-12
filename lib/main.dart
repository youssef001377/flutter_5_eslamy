import 'package:flutter/material.dart';
import 'package:flutter_5_eslamy/utils/services/local_storage_service.dart';
import 'package:flutter_5_eslamy/widgets/onboarding.dart';
import 'package:flutter_5_eslamy/widgets/sepha.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  bool isFirstTime = !(LocalStorageService.getBool('onboardingSeen') ?? false);
  runApp(Eslamy(isFirstTime: isFirstTime));
}

class Eslamy extends StatelessWidget {
  final bool isFirstTime;

  const Eslamy({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isFirstTime ? "/onboarding" : "/sebha",
      routes: {
        "/sebha": (context) => Sebha(),
        "/onboarding": (context) => Onboarding(),
      },
    );
  }
}
