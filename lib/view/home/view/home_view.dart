import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_tracking/view/home/bloc/home_bloc.dart';
import 'package:trip_tracking/view/home/view/subview/first_view.dart';
import 'package:trip_tracking/view/home/view/subview/home_view_subview.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.initial:
            return FirstView();
          case PostStatus.success:
            return HomeWidget();
          default:
            return Scaffold();
        }
      },
    );
  }
}
