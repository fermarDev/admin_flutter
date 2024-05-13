import 'package:admin_app/src/admin/adminHome.dart';
import 'package:admin_app/src/admin/userData.dart';
import 'package:admin_app/src/routes/routes.dart';
import 'package:flutter/material.dart';

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
      routes: getApplicationRoutes(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AdminHome(),
      onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: ((BuildContext context) => UserData()));
      });
  }
}
