import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_tracking/features/model/trip_request_model.dart';
import 'package:trip_tracking/features/model/trip_response_model.dart';
import 'package:trip_tracking/features/widget/error_view.dart';
import 'package:trip_tracking/view/home/bloc/home_bloc.dart';
import 'package:trip_tracking/view/home/view/subview/home_success_widget.dart';
import 'package:trip_tracking/view/home/view/subview/home_view_subview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeBloc>().add(FetchData(TripRequestModel()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.initial:
            return const HomeWidget(
              customWidget: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case PostStatus.success:
            return HomeWidget(
              customWidget: HomeSuccessWidget(
                  responseModel: state.responseModel ?? TripResponseModel()),
            );
          default:
            return const HomeWidget(customWidget: ErrorView());
        }
      },
    );
  }
}
