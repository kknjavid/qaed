import 'package:flutter/material.dart';
import 'package:qaed/global/rtl_material_app_with_theme.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rtlMaterialAppWithTheme(widget: Scaffold(
      appBar: AppBar(title: Text("aboutUs"))),
    );
  }
}
