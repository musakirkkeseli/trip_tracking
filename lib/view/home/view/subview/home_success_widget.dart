import 'package:flutter/material.dart';
import 'package:trip_tracking/features/model/trip_response_model.dart';
import 'package:trip_tracking/view/home/view/subview/hotel_card.dart';
import 'package:trip_tracking/view/home/view/subview/weather_card.dart';

class HomeSuccessWidget extends StatelessWidget {
  final TripResponseModel responseModel;
  const HomeSuccessWidget({super.key, required this.responseModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (responseModel.cities ?? []).length,
      itemBuilder: (context, index) {
        Cities city = responseModel.cities![index];
        return Card(
            child: Column(
          children: [
            Text(
              city.cityName ?? "",
              style: TextStyle(fontSize: 20),
            ),
            // const Text("Hava Durumu"),
            SizedBox(
              height: 150,
              width: MediaQuery.sizeOf(context).width * .9,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (city.weathers ?? []).length,
                itemBuilder: (context, index) {
                  return WeatherCard(weather: city.weathers![index]);
                },
              ),
            ),
            // const Text("Oteller"),
            SizedBox(
              height: 250,
              width: MediaQuery.sizeOf(context).width * .9,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (city.hotels ?? []).length,
                itemBuilder: (context, index) {
                  return HotelCard(hotel: city.hotels![index]);
                },
              ),
            ),
          ],
        ));
      },
    );
  }
}
