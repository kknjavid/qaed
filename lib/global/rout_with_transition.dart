
  import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> customRoutForPush({required BuildContext context ,required Widget widget, required double horzentalOffset, required double verticalOffset}) {
    return PageRouteBuilder(
                              pageBuilder: (context, animation,
                                      secondaryAnimation) =>
                                  widget,
                              transitionDuration: const Duration(seconds: 1),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                Offset begin = Offset(horzentalOffset, verticalOffset);
                                const end = Offset.zero;
                                final tween = Tween(begin: begin, end: end);
                                final offsetAnimation =
                                    animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              });
  }

