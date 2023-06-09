import 'package:cart_using_block/bloc/contact_bloc.dart';
import 'package:cart_using_block/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'adress_bloc/address_bloc.dart';
import 'data/repository.dart';

void main() {
  runApp(const MyApp());
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
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ContactBloc(repository: CoupinosLogin()),),
          BlocProvider(create: (context) => AddressBloc(repository: CoupinosLogin()),),
      ],
        child: HomePage(),
    ),
    );

  }
}