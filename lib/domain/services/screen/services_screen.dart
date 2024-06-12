import 'package:flutter/material.dart';
import 'package:my_library/domain/services/model/actuator.dart';

import '../model/information.dart';
import '../service/rest_service.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late Future<Information> futureInformation;
  late Future<Actuator> futureActuatorLiveness;
  RestService restService = RestService();

  @override
  void initState() {
    super.initState();
    futureInformation = restService.fetchInformation();
    futureActuatorLiveness = restService.fetchLiveness();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FutureBuilder<Actuator>(
                  future: futureActuatorLiveness,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "hello-world",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Row(
                            children: [
                              Text(
                                'Liveness Status: ',
                              ),
                              Text(
                                '${snapshot.data!.status}',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Readiness Status: ',
                              ),
                              Text(
                                '${snapshot.data!.status}',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    futureInformation = restService.fetchInformation();
                  });
                },
                child: Text('Fetch Data')),
            FutureBuilder<Information>(
              future: futureInformation,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(snapshot.data!.hostName),
                      Text(snapshot.data!.version),
                      Text(snapshot.data!.greeting)
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
