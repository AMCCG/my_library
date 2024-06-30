import 'dart:convert';

import 'package:my_library/domain/services/model/actuator.dart';

import 'package:http/http.dart' as http;

class RestPythonBackendService {
  String apiLiveness =
      "http://192.168.2.39:8765/python-backend-service/actuator/health/liveness";
  String apiReadiness =
      "http://192.168.2.39:8765/python-backend-service/actuator/health/readiness";

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
