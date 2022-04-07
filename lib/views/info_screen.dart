import 'package:flutter/material.dart';
import 'package:qaed/global/rtl_material_app_with_theme.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rtlMaterialAppWithTheme(
      child: const Text("infoScreen"),
    );
  }
}
