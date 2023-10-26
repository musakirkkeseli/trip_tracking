import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_tracking/view/home/bloc/home_bloc.dart';
import 'package:trip_tracking/view/widget/cities_animated_container.dart';
import 'package:trip_tracking/view/widget/date_time_line_visibility.dart';
import 'package:trip_tracking/view/widget/search_button_widget.dart';

class FirstView extends StatelessWidget {
  FirstView({super.key});

  final List<String> cities = [
    "İstanbul",
    "Ankara",
    "Sakarya",
    "İzmir",
    "Erzurum"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SearchButtonWidget(isAutoFocus: true),
                CitiesAnimatedContainer(
                  cities: cities,
                ),
                const SizedBox(
                  height: 10,
                ),
                const DateTimeLineVisibility(),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: 100,
                margin: const EdgeInsets.all(8.0),
                width: MediaQuery.sizeOf(context).width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        context
                            .read<HomeBloc>()
                            .add(DateSet(DateTime(2023, 10, 24)));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomeWidget(
                        //             date: DateTime(2023, 10, 24))));
                      },
                      child: const Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.flag_circle_rounded),
                              Text("Bursa->Erzurum")
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ))
        ],
      )),
    );
  }
}
