import 'package:dcd_app/src/app.dart';
import 'package:dcd_app/src/routes/routes.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      index: MyRoutes.home,
      routes: MyRoutes.data,
    ),
  );
}
