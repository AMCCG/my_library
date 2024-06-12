class Information {
  final String greeting;
  final String hostName;
  final String version;

  const Information({
    required this.greeting,
    required this.hostName,
    required this.version,
  });

  factory Information.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'greeting': String greeting,
        'hostName': String hostName,
        'version': String version
      } =>
        Information(greeting: greeting, hostName: hostName, version: version),
      _ => throw const FormatException('Failed to load data.')
    };
  }
}
