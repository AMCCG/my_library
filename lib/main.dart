import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_library/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Library',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.blueAccent,
          seedColor: Colors.blueAccent,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'My Library :)'),
        '/second': (context) => const SecondScreen(),
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            buildExpanded(context),
            buildContent("Agile Methodology"),
            buildContent("Hello World 2"),
            buildContent("Hello World 3"),
            buildContent("Hello World 4"),
            buildContent("Hello World 5"),
            buildContent("Hello World 6"),
            buildContent("Hello World 7"),
            buildContent("Hello World 8"),
            buildContent("Hello World 9"),
          ],
        ),
      ),
    );
  }

  Expanded buildExpanded(BuildContext context) {
    return Expanded(
      child: Container(
        height: (MediaQuery.of(context).size.height / 2),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: const Border(
            bottom: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: const Text("Content"),
      ),
    );
  }

  Container buildContent(String message) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Text(
            "Mar 23, 2024 · 2 min read",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
