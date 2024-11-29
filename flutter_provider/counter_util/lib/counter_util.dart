import 'package:flutter/material.dart';

class Counter {
  int value;
  Color color;

  Counter({this.value = 0, required this.color});

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
    // Pilih warna secara siklus dari daftar Colors.primaries
    final newColor = Colors.primaries[_counters.length % Colors.primaries.length];
    _counters.add(Counter(color: newColor));
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
