import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import 'package:trip_tracking/features/provider/animated_provider.dart';
import 'package:trip_tracking/features/provider/managment.dart';
import 'package:trip_tracking/features/utlility/constants_string.dart';
import 'package:trip_tracking/features/widget/cities_animated_container.dart';
import 'package:trip_tracking/features/widget/search_button_widget.dart';
import 'package:intl/intl.dart';
import 'package:trip_tracking/features/widget/time_line_picker_widget.dart';

class HomeWidget extends StatefulWidget {
  final data;
  const HomeWidget({super.key, this.data});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(_onScroll);
    super.initState();
  }

  final List<String> cities = [
    "İstanbul",
    "Ankara",
    "Sakarya",
    "İzmir",
    "Erzurum"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AnimatedProvider>(
      builder: (context, value, child) {
        return SafeArea(child: Consumer<Managment>(
          builder: (context, managment, child) {
            return Stack(
              children: [
                Positioned(
                  top: 10,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SearchButtonWidget(),
                          InkWell(
                            onTap: () {
                              Provider.of<AnimatedProvider>(context,
                                      listen: false)
                                  .changeVisible(true);
                            },
                            child: Hero(
                              tag: ConstantsString.datePickerTag,
                              child: Container(
                                width: 60,
                                margin: const EdgeInsets.all(3.0),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: Color.fromRGBO(74, 20, 140, 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        DateFormat("MMM")
                                            .format(managment.date)
                                            .toUpperCase(), // Month
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        managment.date.day.toString(), // Date
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        DateFormat("E")
                                            .format(managment.date)
                                            .toUpperCase(), // WeekDay
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CitiesAnimatedContainer(
                        cities: cities,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 10,
                    child: AnimatedContainer(
                      color: Colors.purple[900],
                      height: 120,
                      width: value.isVisible
                          ? MediaQuery.sizeOf(context).width * .9
                          : 0,
                      padding: const EdgeInsets.all(8.0),
                      duration: const Duration(milliseconds: 300),
                      child: TimeLinePickerWidget(
                        initialSelectedDate: managment.date,
                        onDateChange: (date) {
                          Provider.of<Managment>(context, listen: false)
                              .changeDate(date);
                          Provider.of<AnimatedProvider>(context, listen: false)
                              .changeVisible(false);
                        },
                      ),
                    )),
                Positioned(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    )),
                Positioned(
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        Provider.of<AnimatedProvider>(context, listen: false)
                            .changeAnimated();
                      },
                      child: AnimatedContainer(
                        onEnd: () {
                          print("object");
                        },
                        duration: const Duration(milliseconds: 1300),
                        height: value.isOpen
                            ? MediaQuery.sizeOf(context).height * .6
                            : 150,
                        width: MediaQuery.sizeOf(context).width,
                        padding: value.isOpen
                            ? const EdgeInsets.symmetric(vertical: 16)
                            : const EdgeInsets.symmetric(horizontal: 32),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(74, 20, 140, 1),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(32)),
                        ),
                        child: managment.selectedCityModelList.isEmpty
                            ? const Center(
                                child: Text(
                                "Rota oluşturmak için il ekleyin",
                                style: TextStyle(color: Colors.white),
                              ))
                            : Timeline.tileBuilder(
                                theme: TimelineThemeData(
                                  color: Colors.white,
                                  direction: value.isOpen
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                ),
                                controller: scrollController,
                                builder: TimelineTileBuilder.fromStyle(
                                  contentsAlign: ContentsAlign.reverse,
                                  endConnectorStyle: ConnectorStyle.transparent,
                                  indicatorStyle: IndicatorStyle.dot,
                                  oppositeContentsBuilder: (context, index) =>
                                      value.isOpen
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(children: [
                                                IconButton(
                                                    onPressed: () {
                                                      Provider.of<Managment>(
                                                              context,
                                                              listen: false)
                                                          .changeCityDayPlus(
                                                              index);
                                                    },
                                                    icon: const Icon(
                                                        Icons.plus_one,
                                                        color: Colors.white)),
                                                IconButton(
                                                    onPressed: () {
                                                      Provider.of<Managment>(
                                                              context,
                                                              listen: false)
                                                          .changeCityDayDecrease(
                                                              index);
                                                    },
                                                    icon: const Icon(
                                                        Icons
                                                            .exposure_neg_1_outlined,
                                                        color: Colors.white))
                                              ]),
                                            )
                                          : Text(
                                              "${managment.selectedCityModelList[index].numOfDay} gün",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                  itemExtentBuilder: (context, index) =>
                                      value.isOpen ? 133 : 90,
                                  contentsBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: value.isOpen
                                        ? Text(
                                            '${managment.selectedCityModelList[index].city} (${managment.selectedCityModelList[index].numOfDay} gün)',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )
                                        : Text(
                                            '${managment.selectedCityModelList[index].city}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                  ),
                                  itemCount:
                                      managment.selectedCityModelList.length,
                                ),
                              ),
                      ),
                    ))
              ],
            );
          },
        ));
      },
    ));
  }

  void _onScroll() {
    if (_isBottom) print("çalıştı");
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final minScroll = scrollController.position.minScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= maxScroll || currentScroll <= (minScroll * 1.5);
  }
}
