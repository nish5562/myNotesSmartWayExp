import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'home_screen.dart';
import 'note_structure.dart';

Future<void> main() async {
  // initialise the hive
  await Hive.initFlutter();
  // registered adapter
  Hive.registerAdapter(NoteStructureAdapter());
  // open the box
  await Hive.openBox('testAdpBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Take Notes',
      theme: ThemeData(
        //brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFF393646),
      ),
      // tp remove debug banner
      debugShowCheckedModeBanner: false,
      home: Home(),
      //home:box.deleteFromDisk();
    );
  }
}
