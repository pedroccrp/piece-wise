import 'package:flutter/material.dart';
import 'package:piece_wise/database/piecewise_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PiecewiseDatabase.initDatabase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
