import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_tracking/features/provider/managment.dart';
import 'package:trip_tracking/view/home/bloc/home_bloc.dart';
import 'package:trip_tracking/view/home/view/home_view.dart';
import 'package:trip_tracking/features/widget/cities_animated_container.dart';
import 'package:trip_tracking/view/start/view/subview/date_time_line_visibility.dart';
import 'package:trip_tracking/features/widget/search_button_widget.dart';

class StartView extends StatelessWidget {
  StartView({super.key});

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
                const Text(
                  "Trip Traking",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .1,
                ),
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
                        Provider.of<Managment>(context, listen: false)
                            .goToHomePage();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeView()));
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
