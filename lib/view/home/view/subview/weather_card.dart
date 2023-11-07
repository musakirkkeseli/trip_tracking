import 'package:flutter/material.dart';
import 'package:trip_tracking/features/model/trip_response_model.dart';

class WeatherCard extends StatelessWidget {
  final Weathers weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.purple[900],
        child: SizedBox(
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              weatherIcon(weather.weatherType ?? 0),
              Text(
                "${weather.degree}˚C",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                weather.date ?? "",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ));
  }
}

Icon weatherIcon(int weatherType) {
  switch (weatherType) {
    case 0:
      return const Icon(Icons.sunny, color: Colors.white);
    case 1:
      return const Icon(Icons.cloud, color: Colors.white);
    case 2:
      return const Icon(Icons.cloudy_snowing, color: Colors.white);
    case 3:
      return const Icon(Icons.air, color: Colors.white);
    case 4:
      return const Icon(Icons.thunderstorm, color: Colors.white);
    default:
      return const Icon(Icons.sunny, color: Colors.white);
  }
}
