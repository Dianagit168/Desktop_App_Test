import 'package:desktop_app_test/home_screen.dart';
import 'package:desktop_app_test/provider/carrier_provider.dart';
import 'package:desktop_app_test/provider/content_provider.dart';
import 'package:desktop_app_test/provider/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarrierProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
