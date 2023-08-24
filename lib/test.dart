import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  ValueNotifier valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: valueNotifier,
              builder: ((context, value, child) {
                return Text(
                  '$value',
                  style: TextStyle(fontSize: 20),
                );
              }),
            ),
            ElevatedButton(
              onPressed: () {
                valueNotifier.value = valueNotifier.value++;
              },
              child: Text('add'),
            ),
          ],
        ),
      ),
    );
  }
}
