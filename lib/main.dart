import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qaed/provider/provider_state.dart';
import 'package:qaed/views/hompage.dart';
import 'global/rtl_material_app_with_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WidgetState(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return rtlMaterialAppWithTheme( home:  const HomePage());
  }
}
