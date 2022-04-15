import 'package:flutter/cupertino.dart';

import 'package:qaed/views/years_screen.dart';

class StateModel {
  final Widget bodyScreen;
  final double fontSizeArticleContent;
  StateModel({
    this.bodyScreen = const YearsScreen(),
    this.fontSizeArticleContent = 14,
  });

  StateModel copyWith({
    Widget? bodyScreen,
    double? fontSizeArticleContent,
  }) {
    return StateModel(
      bodyScreen: bodyScreen ?? this.bodyScreen,
      fontSizeArticleContent:
          fontSizeArticleContent ?? this.fontSizeArticleContent,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StateModel &&
        other.bodyScreen == bodyScreen &&
        other.fontSizeArticleContent == fontSizeArticleContent;
  }

  @override
  int get hashCode => bodyScreen.hashCode ^ fontSizeArticleContent.hashCode;
}
