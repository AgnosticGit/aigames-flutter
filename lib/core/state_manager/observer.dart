import 'package:flutter/material.dart';

abstract class Observer  {
  final List<UniqueSetState> _uniqueSetStates = [];

  void addUniqueSetState(UniqueSetState newUniqueSetStates) =>
      _uniqueSetStates.add(newUniqueSetStates);

  void removeUniqueSetStateByKey(UniqueKey key) {
    _uniqueSetStates.removeWhere((element) => element.uniqueKey == key);
  }

  void update() {
    for (final el in _uniqueSetStates) {
      el.setState(() {});
      el.listener?.call();
    }
  }
}

class UniqueSetState {
  const UniqueSetState({
    required this.setState,
    required this.uniqueKey,
    this.listener,
  });

  final SetState setState;

  final UniqueKey uniqueKey;

  final VoidCallback? listener;
}

typedef SetState = void Function(void Function());
