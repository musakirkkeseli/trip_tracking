import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_tracking/features/provider/managment.dart';

class CitiesAnimatedContainer extends StatelessWidget {
  const CitiesAnimatedContainer({
    super.key,
    required this.cities,
  });

  final List<String> cities;

  @override
  Widget build(BuildContext context) {
    return Consumer<Managment>(
      builder: (context, value, child) {
        return AnimatedContainer(
          width: MediaQuery.sizeOf(context).width * .8,
          color: Colors.white,
          height: value.dataSize >= 2 ? 200 : 0,
          duration: const Duration(milliseconds: 300),
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Provider.of<Managment>(context, listen: false)
                      .selectCity(cities[index]);
                  FocusScope.of(context).unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cities[index],
                    style: TextStyle(color: Colors.purple[900]),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
