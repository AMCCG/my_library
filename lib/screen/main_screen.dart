import 'package:flutter/material.dart';

import '../model/document.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key, required this.title});

  String title;

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
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Container(
            color: Colors.black12,
            height: 1.5,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExpanded(context),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Recommended Stories',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
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
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          "assets/images/doberman.png",
          fit: BoxFit.fill,
        ),
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
