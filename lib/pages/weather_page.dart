import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:technical_test/models/weather_model.dart";
import "package:technical_test/services/weather_services.dart";

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('f38c347a3a8e3ae48c6ea74f43982a26');
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  String getWeatherAnimation(String? maincondition) {
    if (maincondition == null) return 'assets/sun.json';

    switch (maincondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/hujan.json';
      case 'thunderstrom':
        return 'assets/hujan.json';
      case 'clear':
        return 'assets/sun.json';
      default:
        return 'assets/sun.json';
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_weather?.cityName ?? "Loading City..."),
              Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
              Text("${_weather?.temperatur.round()}°C"),

              // kondisi awan
              Text(_weather?.mainCondition ?? "")
            ],
          ),
        ));
  }
}
