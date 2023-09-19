import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(
        home: Scaffold(
          body: SafeArea(child: MyHome()),
        ),
      )
  );
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int count = 0;
  void increaseNumber()
  {
    setState(() {
      count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: ()
        {
          increaseNumber();
        }, child:  Text(
        'count = : $count'
      )
    );
  }
}

