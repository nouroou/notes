import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes/db/db_helper.dart';
import 'package:notes/services/theme_service.dart';
import 'package:notes/ui/home_page.dart';
import 'package:notes/ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      themeMode: ThemeService().theme,
      darkTheme: Themes.darkTheme,
      home: const HomePage(),
    );
  }
}
