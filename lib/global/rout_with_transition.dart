import 'dart:math';

import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> customRoutForPush({
  required BuildContext context,
  required Widget widget,
}) {
  final random = Random();
  List<double> offsetValue = [-1, 0, 1];
  double hrz = offsetValue[random.nextInt(offsetValue.length)];
  double vrt = offsetValue[random.nextInt(offsetValue.length)];

  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = Offset(hrz, vrt);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}
