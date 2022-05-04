import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaed/database/db_helper.dart';
import 'package:qaed/views/hompage.dart';
import 'global/rtl_material_app_with_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<DbHelper>(() => DbHelper());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return rtlMaterialAppWithTheme( child:  const HomePage());
  }
}
