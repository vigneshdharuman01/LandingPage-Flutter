import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landingpage/Screens/view/homescreen.dart';

void main() {
  // Ensure that the widget binding is initialized before setting the preferred orientations
  WidgetsFlutterBinding.ensureInitialized();

  // Set the preferred orientations to portrait up and down
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homescreen(),
    );
  }
}
