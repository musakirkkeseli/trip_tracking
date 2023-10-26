import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import 'package:trip_tracking/features/provider/animated_provider.dart';
import 'package:trip_tracking/features/provider/managment.dart';
import 'package:trip_tracking/view/widget/cities_animated_container.dart';
import 'package:trip_tracking/view/widget/search_button_widget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';

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
                          Hero(
                            tag: "datePicker",
                            child: InkWell(
                              onTap: () {
                                Provider.of<AnimatedProvider>(context,
                                        listen: false)
                                    .changeVisible(true);
                              },
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
                      child: DatePicker(
                        DateTime.now(),
                        initialSelectedDate: managment.date,
                        selectionColor: Colors.white,
                        selectedTextColor: const Color.fromRGBO(74, 20, 140, 1),
                        dayTextStyle: const TextStyle(color: Colors.white),
                        dateTextStyle: const TextStyle(color: Colors.white),
                        monthTextStyle: const TextStyle(color: Colors.white),
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
                            ? MediaQuery.sizeOf(context).height
                            : 150,
                        width: MediaQuery.sizeOf(context).width,
                        padding: value.isOpen
                            ? const EdgeInsets.symmetric(vertical: 164)
                            : const EdgeInsets.symmetric(horizontal: 32),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(74, 20, 140, 1),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(32)),
                        ),
                        child: Timeline.tileBuilder(
                          theme: TimelineThemeData(
                            color: Colors.white,
                            direction:
                                value.isOpen ? Axis.vertical : Axis.horizontal,
                          ),
                          controller: scrollController,
                          builder: TimelineTileBuilder.fromStyle(
                            contentsAlign: ContentsAlign.basic,
                            endConnectorStyle: ConnectorStyle.transparent,
                            indicatorStyle: IndicatorStyle.dot,
                            contentsBuilder: (context, index) => Padding(
                              padding: value.isOpen
                                  ? const EdgeInsets.all(32.0)
                                  : const EdgeInsets.all(8.0),
                              child: Text(
                                'İstanbul $index',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            itemCount: 16,
                          ),
                        ),
                      ),
                    ))
                // SizedBox(
                //   height: MediaQuery.sizeOf(context).height,
                //   child: Container(
                //     height: MediaQuery.sizeOf(context).height,
                //   ),
                // ),
                // const Positioned(bottom: 0, child: ExhibitionBottomSheet()),
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
