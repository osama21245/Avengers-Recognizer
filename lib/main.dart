import 'package:recognizer/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recognizer/core/constant/localization/changelocal.dart';
import 'package:recognizer/routes.dart';

import 'binding/initialbinding.dart';
//import 'core/constant/color.dart';
import 'core/constant/localization/changelocal.dart';
import 'core/constant/services/services.dart';
import 'core/constant/services/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    // MyServices myServices = Get.find();
    return GetMaterialApp(
      theme: ThemeSrevice().lightTheme,
      darkTheme: ThemeSrevice().darkTheme,
      themeMode: ThemeSrevice().getThemeMode(),
      debugShowCheckedModeBanner: false,
      title: 'Avengers',
      locale: controller.language,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
