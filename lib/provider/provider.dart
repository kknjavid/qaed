import 'package:flutter/material.dart';

class Provder extends InheritedWidget {
  Provder({Key? key, required this.child}) : super(key: key, child: child);

  final Widget child;

  static Provder? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provder>();
  }

  @override
  bool updateShouldNotify(Provder oldWidget) {
    return true;
  }
}

