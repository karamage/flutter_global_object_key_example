# flutter_global_object_key_example

This is a sample program that uses GlobalObjectKey to call child methods from parent in Flutter Widget.

## How do I call a method of a child from its parent?
In Flutter, is there ever a time when you want to call a method of a child widget from a parent widget?

Yes, I do.

I often forget how to do this, so I thought I'd write it down here for my own reminder.

In conclusion, to call a child method from its parent, use GlobalObjectKey.

## Using GlobalObjectKey to call child methods from parent
Let's put aside the complicated explanation of what GlobalObjectKey is, and explain how to use it in practice with an example.

Let's say you are building a common counter application as follows.

<img width="200" alt="Screen Shot 2021-12-05 at 15 23 53" src="https://user-images.githubusercontent.com/330715/144738792-c6aa3c04-1870-4929-84e2-4e265ea6c9f5.png">

## Defining a Child Widget
As a child Widget, we define a Widget that has a stateful counter state and displays the counter as a Counter class.

CounterState has a method called incrementCounter that increases the counter by one.

```dart
class Counter extends StatefulWidget {
  Counter({Key? key}) : super(key: key);

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
```

## Defining the parent Widget
Next, we define the CounterPage class as the parent Widget that wraps the Counter, as shown below.

Now, the question is, how can I call the incrementCounter() of Counter when I press FAB?

The answer is that you can call it using GlobalObjectKey as shown below.

```dart
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

```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
