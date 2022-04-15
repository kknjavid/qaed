import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qaed/provider/state_model.dart';
import 'package:qaed/views/bookmark_screen.dart';
import 'package:qaed/views/info_screen.dart';
import 'package:qaed/views/searchScreen.dart';
import 'package:qaed/views/years_screen.dart';

class WidgetState extends StatefulWidget {
  const WidgetState({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<WidgetState> createState() => _WidgetStateState();
}

class _WidgetStateState extends State<WidgetState> {
  StateModel state = StateModel();

  void changeBodyScreen(int index) {
    List<StatelessWidget> bodyScreen = [
      const YearsScreen(),
      const BookmarkScreen(),
      const SearchScreen(),
      const InfoScreen()
    ];
    if (index >= 4) {
      SystemNavigator.pop();
    } else {
      final newState = state.copyWith(bodyScreen: bodyScreen[index]);
      setState(() {
        state = newState;
      });
    }
  }






  @override
  Widget build(BuildContext context) {
    return InheritedProvider(
        widgetState: this, state: state, child: widget.child);
  }

  void changeCurScreen(int index) {}
}

//-----------> inherited widget

class InheritedProvider extends InheritedWidget {
  InheritedProvider(
      {Key? key,
      required this.widgetState,
      required this.state,
      required this.child})
      : super(key: key, child: child);

  final Widget child;
  final _WidgetStateState widgetState;
  final StateModel state;

  static _WidgetStateState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedProvider>()!
        .widgetState;
  }

  @override
  bool updateShouldNotify(InheritedProvider oldWidget) {
    return oldWidget.state != state;
  }
}
