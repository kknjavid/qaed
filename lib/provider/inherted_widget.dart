import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qaed/global/rout_with_transition.dart';
import 'package:qaed/provider/state_model.dart';
import 'package:qaed/views/bookmark_screen.dart';
import 'package:qaed/views/info_screen.dart';
import 'package:qaed/views/search_screen.dart';
import 'package:qaed/views/years_screen.dart';

class ProividerWidget extends StatefulWidget {
  const ProividerWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<ProividerWidget> createState() => _ProividerWidgetState();
}

class _ProividerWidgetState extends State<ProividerWidget> {
  StateModel state = StateModel();

  //-------------------> start state management
  //
  //

  void changeBodyScreen(int index, context) {
    final List<Widget> bodyScreen = [
      const YearsScreen(),
      const BookmarkScreen(),
      const SearchScreen(),
      const InfoScreen()
    ];
    if (index > 3) {
      SystemNavigator.pop();
    } else {
      final newState = state.copyWith(bodyScreen: bodyScreen[index]);
      setState(() {
        state = newState;
      });
    }
  }
  //
  //
  //-------------------> end state management

  @override
  Widget build(BuildContext context) {
    return InhertedWidget(
        proividerWidgetState: this, stateModel: state, child: widget.child);
  }
}

//----------------> inherited widget
class InhertedWidget extends InheritedWidget {
  const InhertedWidget(
      {Key? key,
      required this.proividerWidgetState,
      required this.stateModel,
      required this.child})
      : super(key: key, child: child);

  final Widget child;
  final _ProividerWidgetState proividerWidgetState;
  final StateModel stateModel;

  static _ProividerWidgetState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InhertedWidget>()!
        .proividerWidgetState;
  }

  @override
  bool updateShouldNotify(InhertedWidget oldWidget) {
    return oldWidget.stateModel != stateModel;
  }
}
