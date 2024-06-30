import 'dart:convert';

import 'package:my_library/domain/services/model/actuator.dart';

import 'package:http/http.dart' as http;

import '../model/information.dart';

class RestSpringHelloService {
  String apiLiveness = "http://192.168.2.39:8001/actuator/health/liveness";
  String apiReadiness = "http://192.168.2.39:8001/actuator/health/readiness";
  String apiGreeting = "http://192.168.2.39:8765/hello-world/greeting";

  Future<Information> fetchInformation() async {
    final response = await http.get(Uri.parse(apiGreeting));
    if (response.statusCode == 200) {
      return Information.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Actuator> fetchLiveness() async {
    final response = await http.get(Uri.parse(apiLiveness));
    if (response.statusCode == 200) {
      return Actuator.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Actuator> fetchReadiness() async {
    final response = await http.get(Uri.parse(apiReadiness));
    if (response.statusCode == 200) {
      return Actuator.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
