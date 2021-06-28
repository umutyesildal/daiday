import 'package:daiday/addState/state/moodState.dart';
import 'package:daiday/service_locator.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black,
        ),
        home: App(),
      ),
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoodState(),
        ),
      ],
    );
  }
}
