import 'package:bondsapp/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bonds_bloc_observer.dart';
import 'injection/injection_config.dart';

void main() {
  configureDependencies();

  Bloc.observer = BondsBlocObserver();

  runApp(const BondsApp());
}

class BondsApp extends StatelessWidget {
  const BondsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bonds Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro Display',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[50],
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}