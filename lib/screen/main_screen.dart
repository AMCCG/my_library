import 'package:flutter/material.dart';

import '../model/document.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key, required this.title});

  String title;

  List<Document> items = [
    Document("Agile Methodology", "Mar 23, 2024 · 3 min read", "agile",
        "assets/images/agile-logo.jpg"),
    Document("Jenkins", "Mar 23, 2024 · 2 min read", "jenkins",
        "assets/images/jenkins.png"),
    Document("Dev & Sec & Ops", "Mar 23, 2024 · 2 min read", "", ""),
    Document("Docker", "Mar 23, 2024 · 2 min read", "", ""),
    Document("Kubernetes", "Mar 23, 2024 · 2 min read", "", ""),
    Document(
        "Data Structures & Algorithms", "Mar 23, 2024 · 2 min read", "", ""),
    Document("Java", "Mar 23, 2024 · 2 min read", "", ""),
    Document("Python", "Mar 23, 2024 · 2 min read", "", ""),
    Document("Dart", "Mar 23, 2024 · 2 min read", "", ""),
    Document("Flutter", "Mar 23, 2024 · 2 min read", "", ""),
    Document("Software Architecture", "Mar 23, 2024 · 2 min read", "", ""),
    Document("Microservices", "Mar 23, 2024 · 2 min read", "", ""),
    Document("Monolith", "Mar 23, 2024 · 2 min read", "", ""),
    Document(
        "Service Oriented Architecture", "Mar 23, 2024 · 2 min read", "", ""),
    Document("Math", "Mar 23, 2024 · 2 min read", "", "")
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
        body: Column(
          children: [
            Expanded(
              child: _buildListView(),
            ),
          ],
        ));
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
              _buildStories(index, context),
            ],
          );
        }
        if (index == (items.length - 1)) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStories(index, context),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Who to follow',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              _getUser(),
            ],
          );
        }
        return _buildStories(index, context);
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

  Container _buildStories(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: GestureDetector(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: _getCoverImage(items[index]),
            ),
            ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].subTitle),
            ),
          ],
        ),
        onTap: () {
          if (items[index].link.isNotEmpty) {
            Navigator.pushNamed(context, '/${items[index].link}',
                arguments: {'title': items[index].title});
          }
        },
      ),
    );
  }

  Widget _getCoverImage(Document document) {
    if (document.coverImage.isNotEmpty) {
      return Image.asset(
        document.coverImage,
        fit: BoxFit.fill,
      );
    }
    return Placeholder();
  }

  Widget _getUser() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          5,
          (index) {
            return Container(
              color: Colors.red,
              width: 200,
              height: 200,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/doberman.png",
                      fit: BoxFit.fill,
                      width: 100,
                    ),
                    Text('John $index'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
