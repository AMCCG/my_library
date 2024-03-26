import 'package:flutter/material.dart';

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
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Library :)'),
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
            Expanded(
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
            ),
            buildContent("Hello World 1"),
            buildContent("Hello World 2"),
            buildContent("Hello World 3"),
            buildContent("Hello World 4"),
            buildContent("Hello World 5"),
          ],
        ),
      ),
    );
  }

  Expanded buildContent(String message) {
    return Expanded(
      child: Container(
        // color: Colors.lightGreenAccent,
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: Text(message),
      ),
    );
  }
}
