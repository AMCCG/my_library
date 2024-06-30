import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_library/domain/services/model/actuator.dart';

import '../service/rest_python_backend_service.dart';
import '../service/rest_spring_hello_world_service.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late Future<Actuator> futureActuatorLiveness;
  late Future<Actuator> futureActuatorReadiness;
  RestSpringHelloService restSpringHelloService = RestSpringHelloService();

  late Future<Actuator> futurePythonLiveness;
  late Future<Actuator> futurePythonReadiness;
  RestPythonBackendService restPythonBackendService =
      RestPythonBackendService();

  Timer? timer;

  @override
  void initState() {
    super.initState();
    fetchData();
    timer =
        Timer.periodic(const Duration(seconds: 60), (Timer t) => fetchData());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void fetchData() {
    print("Fetch Data");
    setState(() {
      futureActuatorLiveness = restSpringHelloService.fetchLiveness();
      futureActuatorReadiness = restSpringHelloService.fetchReadiness();
      futurePythonLiveness = restPythonBackendService.fetchLiveness();
      futurePythonReadiness = restPythonBackendService.fetchReadiness();
    });
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
            buildCardFactory("hello-world"),
            buildCardFactory("python-backend-service"),
          ],
        ),
      ),
    );
  }

  Card buildCardFactory(String serviceName) {
    if (serviceName == "hello-world") {
      return _buildCardSpring(serviceName);
    } else if (serviceName == "python-backend-service") {
      return _buildCardPython(serviceName);
    }
    return const Card();
  }

  Card _buildCardSpring(String serviceName) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              serviceName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              children: [
                const Text(
                  'Liveness Status: ',
                ),
                FutureBuilder<Actuator>(
                  future: futureActuatorLiveness,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return buildActuatorUp(snapshot);
                      } else if (snapshot.hasError) {
                        return buildActuatorDown();
                      }
                    }
                    return buildCircularProgressIndicator();
                  },
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  'Readiness Status: ',
                ),
                FutureBuilder<Actuator>(
                  future: futureActuatorReadiness,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return buildActuatorUp(snapshot);
                      } else if (snapshot.hasError) {
                        return buildActuatorDown();
                      }
                    }
                    return buildCircularProgressIndicator();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Card _buildCardPython(String serviceName) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              serviceName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              children: [
                const Text(
                  'Liveness Status: ',
                ),
                FutureBuilder<Actuator>(
                  future: futurePythonLiveness,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return buildActuatorUp(snapshot);
                      } else if (snapshot.hasError) {
                        return buildActuatorDown();
                      }
                    }
                    return buildCircularProgressIndicator();
                  },
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  'Readiness Status: ',
                ),
                FutureBuilder<Actuator>(
                  future: futurePythonReadiness,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return buildActuatorUp(snapshot);
                      } else if (snapshot.hasError) {
                        return buildActuatorDown();
                      }
                    }
                    return buildCircularProgressIndicator();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Text buildActuatorUp(AsyncSnapshot<Actuator> snapshot) {
    return Text(
      snapshot.data!.status,
      style: const TextStyle(color: Colors.green),
    );
  }

  Text buildActuatorDown() {
    return const Text(
      'DOWN',
      style: TextStyle(color: Colors.red),
    );
  }

  SizedBox buildCircularProgressIndicator() {
    return const SizedBox(
      width: 10,
      height: 10,
      child: CircularProgressIndicator(),
    );
  }
}
