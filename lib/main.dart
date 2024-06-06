import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_library/screen/agile_screen.dart';
import 'package:my_library/screen/jenkins_screen.dart';
import 'package:my_library/screen/main_screen.dart';

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
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'My Library :)'),
        '/main': (context) => MainScreen(title: 'My Library :)'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 192, 23, 1),
        title: Text(
          widget.title,
          style: GoogleFonts.kanit(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Container(
            color: Colors.black,
            height: 1.5,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: const Color.fromRGBO(255, 192, 23, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Stay Curious.',
                        style: GoogleFonts.kanit(
                          fontSize: 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                      child: Text(
                        'Discover stories, thinking, and expertise from writers on any topic.',
                        style: GoogleFonts.kanit(
                            color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/main');
                        },
                        child: Text(
                          "Start reading",
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.title,
                        style: GoogleFonts.kanit(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 32),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: GoogleFonts.kanit(color: Colors.white),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'Help',
                            style: GoogleFonts.kanit(color: Colors.white),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'Terms',
                            style: GoogleFonts.kanit(color: Colors.white),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'Privacy',
                            style: GoogleFonts.kanit(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
