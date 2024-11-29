import 'package:flutter/material.dart';
import 'package:counter_util/counter_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Counter App',
      home: CounterListPage(),
    );
  }
}

class CounterListPage extends StatefulWidget {
  const CounterListPage({super.key});

  @override
  State<CounterListPage> createState() => _CounterListPageState();
}

class _CounterListPageState extends State<CounterListPage> {
  final GlobalState globalState = GlobalState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Counter App'),
        actions: [
          // Tombol tambah counter
          IconButton(
            onPressed: () {
              setState(() {
                globalState.addCounter();
              });
            },
            icon: const Icon(Icons.add),
          ),
          // Tombol hapus counter terakhir
          IconButton(
            onPressed: () {
              if (globalState.counters.isNotEmpty) {
                setState(() {
                  globalState.removeCounter(globalState.counters.length - 1);
                });
              }
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: ReorderableListView.builder(
        itemCount: globalState.counters.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            globalState.reorderCounters(oldIndex, newIndex);
          });
        },
        itemBuilder: (context, index) {
          final counter = globalState.counters[index];
          return CounterCard(
            key: ValueKey(counter),
            counter: counter,
            counterIndex: index + 1, // Menampilkan nomor urutan counter
            onIncrement: () {
              setState(() {
                globalState.incrementCounter(index);
              });
            },
            onDecrement: () {
              setState(() {
                globalState.decrementCounter(index);
              });
            },
            onRemove: () {
              setState(() {
                globalState.removeCounter(index);
              });
            },
            onChangeColor: () {
              setState(() {
                globalState.changeCounterColor(index);
              });
            },
          );
        },
      ),
    );
  }
}

class CounterCard extends StatelessWidget {
  final Counter counter;
  final int counterIndex;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;
  final VoidCallback onChangeColor;

  const CounterCard({
    required this.counter,
    required this.counterIndex,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
    required this.onChangeColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: counter.color,
      child: ListTile(
        title: Text(
          'Counter $counterIndex: ${counter.value}', // Label nomor urutan counter
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: onRemove,
          icon: const Icon(Icons.delete, color: Colors.black),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onDecrement,
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: onIncrement,
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: onChangeColor,
              icon: const Icon(Icons.color_lens),
            ),
          ],
        ),
      ),
    );
  }
}
