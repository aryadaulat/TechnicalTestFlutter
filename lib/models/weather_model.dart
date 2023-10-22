class Weather {
  final String cityName;
  final double temperatur;
  final String mainCondition;

  Weather(
      {required this.cityName,
      required this.temperatur,
      required this.mainCondition});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperatur: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
