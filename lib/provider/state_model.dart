import 'package:flutter/cupertino.dart';
import 'package:qaed/views/years_screen.dart';

class StateModel {
final Widget bodyScreen;

  StateModel({
    this.bodyScreen=const YearsScreen(),
    
  });

  StateModel copyWith({
    Widget? bodyScreen,
  }) {
    return StateModel(
      bodyScreen: bodyScreen ?? this.bodyScreen,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StateModel &&
      other.bodyScreen == bodyScreen;
  }

  @override
  int get hashCode => bodyScreen.hashCode;
}
