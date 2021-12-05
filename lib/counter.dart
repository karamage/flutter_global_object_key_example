import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({Key? key}) : super(key: key);

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int counter = 0;

  void setCounter(int value) {
    setState(() {
      counter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
