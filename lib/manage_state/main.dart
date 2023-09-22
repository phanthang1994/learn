import 'package:flutter/material.dart';
//https://viblo.asia/p/hoc-flutter-tu-co-ban-den-nang-cao-phan-4-lot-tran-inheritedwidget-3P0lPDbmlox
// cách 1 Passing state down counter: 1 and lifting data  _counter++;
void main() {
  runApp(
    MaterialApp(
      home: MyHomePage(isLoading: false, counter: 1),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  final bool isLoading;
  final int counter;

  const MyHomePage({
    required this.isLoading,
    required this.counter,
  });

  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  late bool _isLoading;
  late int _counter;
  @override
  void initState() {
    super.initState();
    _isLoading = widget.isLoading;
    _counter = widget.counter;
  }
  @override
  Widget build(BuildContext context) {
    print('rebuild MyHomePage');
    return Scaffold(
      body: Center(
        child: CounterWidget(
          isLoading: _isLoading,
          counter:_counter,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onFloatingButtonClicked,
      ),
    );
  }

  void onFloatingButtonClicked() {
    print('Button clicked!. Call setState method');
    setState(() {
      _counter++;
    });
  }
}

class CounterWidget extends StatelessWidget {
  final bool isLoading;
  final int counter;

  const CounterWidget({super.key,
    required this.isLoading,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading ? CircularProgressIndicator() : Text('$counter');
  }
}
