import 'package:flutter/material.dart';
import 'package:piece_wise/database/piecewise_database.dart';
import 'package:piece_wise/routes/piecewise_router.dart';
import 'package:piece_wise/routes/piecewise_routes.dart';

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
      initialRoute: PiecewiseRoutes.pieceFeed,
      onGenerateRoute: PiecewiseRouter.generateRoute,
    );
  }
}
