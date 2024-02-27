import 'package:flutter/material.dart';
import 'package:trip_tracking/features/utlility/constants_string.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(ConstantsString.errorMessage),
    );
  }
}
