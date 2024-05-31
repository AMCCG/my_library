import 'package:flutter/material.dart';
import 'package:my_library/screen/agile_screen.dart';
import 'package:my_library/model/document.dart';
import 'package:my_library/screen/jenkins_screen.dart';

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
        '/agile': (context) => const AgileScreen(),
        '/jenkins': (context) => const JenkinsScreen(),
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
  List<Document> items = [
    Document("Agile Methodology", "Mar 23, 2024 · 3 min read", "agile"),
    Document("Dev & Sec & Ops", "Mar 23, 2024 · 2 min read", ""),
    Document("Jenkins", "Mar 23, 2024 · 2 min read", "jenkins"),
    Document("Docker", "Mar 23, 2024 · 2 min read", ""),
    Document("Kubernetes", "Mar 23, 2024 · 2 min read", ""),
    Document("Data Structures & Algorithms", "Mar 23, 2024 · 2 min read", ""),
    Document("Java", "Mar 23, 2024 · 2 min read", ""),
    Document("Python", "Mar 23, 2024 · 2 min read", ""),
    Document("Dart", "Mar 23, 2024 · 2 min read", ""),
    Document("Flutter", "Mar 23, 2024 · 2 min read", ""),
    Document("Software Architecture", "Mar 23, 2024 · 2 min read", ""),
    Document("Microservices", "Mar 23, 2024 · 2 min read", ""),
    Document("Monolith", "Mar 23, 2024 · 2 min read", ""),
    Document("Service Oriented Architecture", "Mar 23, 2024 · 2 min read", ""),
    Document("Math", "Mar 23, 2024 · 2 min read", "")
  ];

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
        child: _buildListView(),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              _buildExpanded(context),
              _buildContent(index, context),
            ],
          );
        }
        return _buildContent(index, context);
      },
    );
  }

  Container _buildExpanded(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height / 2),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: const Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Image.asset(
        "assets/images/sloth.png",
      ),
    );
  }

  Container _buildContent(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: ListTile(
        title: Text(items[index].title),
        subtitle: Text(items[index].subTitle),
        onTap: () {
          if (items[index].link.isNotEmpty) {
            Navigator.pushNamed(context, '/${items[index].link}',
                arguments: {'title': items[index].title});
          }
        },
      ),
    );
  }
}
