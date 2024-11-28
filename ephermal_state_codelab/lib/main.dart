import 'package:flutter/material.dart';

void main() => runApp(MyEphemeralApp());

class MyEphemeralApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Advanced Counter App')),
        body: CounterList(),
      ),
    );
  }
}

class CounterItem {
  int count;
  Color color;
  String label;

  CounterItem({required this.count, required this.color, required this.label});
}

class CounterList extends StatefulWidget {
  @override
  _CounterListState createState() => _CounterListState();
}

class _CounterListState extends State<CounterList> {
  List<CounterItem> counters = [];

  void _addCounter() {
    setState(() {
      counters.add(CounterItem(
        count: 0,
        color: Colors.primaries[counters.length % Colors.primaries.length],
        label: 'Counter ${counters.length + 1}',
      ));
    });
  }

  void _reorderCounter(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final item = counters.removeAt(oldIndex);
      counters.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _addCounter,
          child: Text('Add Counter'),
        ),
        Expanded(
          child: ReorderableListView(
            onReorder: _reorderCounter,
            children: counters
                .map((counter) => CounterWidget(
                      key: ValueKey(counter.label),
                      counterItem: counter,
                      onUpdate: () => setState(() {}),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class CounterWidget extends StatefulWidget {
  final CounterItem counterItem;
  final VoidCallback onUpdate;

  CounterWidget({Key? key, required this.counterItem, required this.onUpdate})
      : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  void _increment() {
    setState(() {
      widget.counterItem.count++;
    });
    widget.onUpdate();
  }

  void _decrement() {
    setState(() {
      if (widget.counterItem.count > 0) {
        widget.counterItem.count--;
      }
    });
    widget.onUpdate();
  }

 void _changeColor() {
  setState(() {
    final currentColorIndex = Colors.primaries.indexOf(widget.counterItem.color);
    if (currentColorIndex == -1) {
      // Jika warna tidak ditemukan, atur ke warna pertama
      widget.counterItem.color = Colors.primaries[0];
    } else {
      // Lanjutkan rotasi warna
      widget.counterItem.color =
          Colors.primaries[(currentColorIndex + 1) % Colors.primaries.length];
    }
  });
  widget.onUpdate();
}


  @override
  Widget build(BuildContext context) {
    return Card(
      key: widget.key,
      color: widget.counterItem.color.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              widget.counterItem.label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Count: ${widget.counterItem.count}',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _decrement,
                  child: Text('Decrement'),
                ),
                ElevatedButton(
                  onPressed: _increment,
                  child: Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: _changeColor,
                  child: Text('Change Color'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
