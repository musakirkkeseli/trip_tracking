import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:trip_tracking/features/provider/animated_provider.dart';
import 'package:trip_tracking/features/provider/managment.dart';
import 'package:trip_tracking/view/home/bloc/home_bloc.dart';
import 'package:trip_tracking/view/start/view/start_view.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Managment()),
        ChangeNotifierProvider(create: (_) => AnimatedProvider()),
      ],
      child: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
        child: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StartView(),
    );
  }
}
