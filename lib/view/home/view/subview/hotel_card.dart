import 'package:flutter/material.dart';
import 'package:trip_tracking/features/model/trip_response_model.dart';

class HotelCard extends StatelessWidget {
  final Hotels hotel;
  const HotelCard({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(hotel.image ??
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKN4wL0OVMx2QzZtO1-rrZO-Sn1o8-pK7H6A&usqp=CAU"))),
        ),
        SizedBox(
          width: 150,
          child: ListTile(
            titleTextStyle: TextStyle(fontSize: 13, color: Colors.black),
            subtitleTextStyle: TextStyle(fontSize: 11),
            title: Text(
              hotel.hotelName ?? "",
            ),
            subtitle: const Row(
              children: [
                Text("2000 TL"),
                Spacer(),
                Text("4.5"),
                Icon(
                  Icons.star,
                  size: 12,
                  color: Colors.orange,
                )
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(hotel.hotelName ?? ""),
        // ),
        // const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Text("2000 TL"),
        // ),
      ],
    ));
  }
}
