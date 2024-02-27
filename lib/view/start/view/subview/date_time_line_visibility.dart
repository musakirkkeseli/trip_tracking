import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_tracking/features/provider/managment.dart';
import 'package:trip_tracking/features/widget/time_line_picker_widget.dart';
import 'package:trip_tracking/view/home/view/home_view.dart';

class DateTimeLineVisibility extends StatelessWidget {
  const DateTimeLineVisibility({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: Provider.of<Managment>(context).isSelectedCity,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(8.0),
        child: TimeLinePickerWidget(
          onDateChange: (date) {
            FocusScope.of(context).unfocus();
            // context.read<HomeBloc>().add(DateSet(date));
            Provider.of<Managment>(context, listen: false).changeDate(date);
            Provider.of<Managment>(context, listen: false).goToHomePage();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeView()));
            // Navigator.of(context).push(
            //   PageRouteBuilder(
            //     fullscreenDialog: true,
            //     transitionDuration: Duration(milliseconds: 1000),
            //     pageBuilder: (BuildContext context,
            //         Animation<double> animation,
            //         Animation<double> secondaryAnimation) {
            //       return HomeView(date: date);
            //     },
            //     transitionsBuilder: (BuildContext context,
            //         Animation<double> animation,
            //         Animation<double> secondaryAnimation,
            //         Widget child) {
            //       return FadeTransition(
            //         opacity:
            //             animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
            //         child: child,
            //       );
            //     },
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
