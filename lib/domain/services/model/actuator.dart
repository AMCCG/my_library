class Actuator {
  String status;

  Actuator(this.status);

  factory Actuator.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'status': String status} => Actuator(status),
      _ => throw const FormatException('Failed to load data.'),
    };
  }
}
