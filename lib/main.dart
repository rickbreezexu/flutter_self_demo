import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_self_demo/module/test_ani_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // 生成随机颜色

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color getRandomColor() {
    final Random random = Random();
    int min = 100;
    int max = 220; // 不要太浅，也不要太暗
    return Color.fromARGB(
      255,
      min + random.nextInt(max - min),
      min + random.nextInt(max - min),
      min + random.nextInt(max - min),
    );
  }

  final int itemCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TestAniOne()),
              );
            },
            child: Container(
              height: 80,
              color: getRandomColor(),
              alignment: Alignment.center,
              child: Text(
                'TestAniOne',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
