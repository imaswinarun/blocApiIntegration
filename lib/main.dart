import 'package:apiTask/screens/homeScreen/bloc/homeScreen_list_bloc.dart';
import 'package:apiTask/screens/homeScreen/bloc/homeScreen_list_event.dart';
import 'package:apiTask/screens/homeScreen/homeScreen.dart';
import 'package:apiTask/screens/homeScreen/networkBloc/network_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/homeScreen/networkBloc/network_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              HomeScreenListBloc()..add(HomeScreenListInitialLoadEvent()),
        ),
        BlocProvider(
          create: (context) =>
              NetworkBloc()..add(NetworkistenConnectionEvent()),
        ),
      ], child: HomeScreen()),
    );
  }
}
