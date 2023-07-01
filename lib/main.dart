import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test_assignment/services/fact.dart';
import 'package:flutter_test_assignment/services/hive_service.dart';
import 'package:flutter_test_assignment/ui/home_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart  ';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await HiveService.init();
  Hive.registerAdapter(FactAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
