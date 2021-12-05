import 'package:flutter/material.dart';
import 'package:flutter_global_object_key_example/counter.dart';

class CounterPage extends StatelessWidget {
  final String title;
  CounterPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterKey = GlobalObjectKey<CounterState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Counter(key: counterKey),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ここでCounterのincrementCounter()を呼び出す
          counterKey.currentState?.incrementCounter();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
