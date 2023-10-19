import 'package:flutter/material.dart';
import 'package:trip_tracking/widget/exhibition_bottom_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          ExhibitionBottomSheet(),
        ],
      ),
    );
  }
}
