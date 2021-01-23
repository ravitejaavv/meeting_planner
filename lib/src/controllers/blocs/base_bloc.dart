import 'package:flutter/material.dart';

abstract class BaseBloc {
  void dispose();
}

class MeetingPlannerBlocProvider<T extends BaseBloc> extends StatefulWidget {
  MeetingPlannerBlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final Widget child;
  final T bloc;

  @override
  _BlockProviderState<T> createState() => _BlockProviderState<T>();

  static T of<T extends BaseBloc>(BuildContext context) {
    _BlocProviderInherited<T> provider =
        context.getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>().widget;
    return provider.bloc;
  }
}

class _BlockProviderState<T extends BaseBloc> extends State<MeetingPlannerBlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _BlocProviderInherited<T>(
        child: widget.child,
        bloc: widget.bloc,
      ),
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}