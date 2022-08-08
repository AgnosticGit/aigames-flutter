import 'package:flutter/material.dart';
import 'observer.dart';

class AppBuilder<T extends Observer> extends StatefulWidget {
  const AppBuilder({
    required this.observable,
    required this.builder,
    this.listener,
    super.key,
  });

  final T observable;

  final Function(T store)? listener;

  final Widget Function(T store) builder;

  @override
  State<AppBuilder> createState() => _AppBuilderState<T>();
}

class _AppBuilderState<T extends Observer> extends State<AppBuilder<T>> {
  final uniqueKey = UniqueKey();

  @override
  void initState() {
    final uniqueSetState = UniqueSetState(
      uniqueKey: uniqueKey,
      setState: setState,
      listener: () => widget.listener?.call(widget.observable),
    );
    widget.observable.addUniqueSetState(uniqueSetState);

    super.initState();
  }

  @override
  void dispose() {
    widget.observable.removeUniqueSetStateByKey(uniqueKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(widget.observable);
  }
}
