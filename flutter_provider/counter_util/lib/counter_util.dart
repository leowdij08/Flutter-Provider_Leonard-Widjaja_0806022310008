library counter_util;

import 'package:flutter/material.dart';

class Counter {
  int value;
  Color color;

  Counter({this.value = 0, this.color = Colors.blue});

  void increment() {
    value++;
  }

  void decrement() {
    if (value > 0) value--;
  }

  void changeColor(Color newColor) {
    color = newColor;
  }
}

class GlobalState {
  final List<Counter> _counters = [];

  List<Counter> get counters => _counters;

  void addCounter() {
    _counters.add(Counter());
  }

  void removeCounter(int index) {
    _counters.removeAt(index);
  }

  void incrementCounter(int index) {
    _counters[index].increment();
  }

  void decrementCounter(int index) {
    _counters[index].decrement();
  }

  void changeCounterColor(int index, Color newColor) {
    _counters[index].changeColor(newColor);
  }

  void reorderCounters(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final counter = _counters.removeAt(oldIndex);
    _counters.insert(newIndex, counter);
  }
}