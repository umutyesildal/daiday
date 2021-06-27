import 'package:daiday/addState/state/moodState.dart';
import 'package:daiday/screens/addPage/addPage.dart';
import 'package:daiday/screens/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

import 'app.dart';

List<Mood> moods = [
  Mood(mood: 'happy'),
  Mood(mood: 'cheerful'),
  Mood(mood: 'fine'),
  Mood(mood: 'bad'),
  Mood(mood: 'awful'),
  Mood(mood: 'dizzy'),
  Mood(mood: 'exhausted'),
];

List<Activities> activities = [
  Activities(emoji: '🧳', activity: 'travel'),
  Activities(emoji: '💄', activity: 'makeup'),
  Activities(emoji: '🏋🏻', activity: 'workout'),
  Activities(emoji: '🚴🏻', activity: 'cycle'),
  Activities(emoji: '🧘🏻‍♂️', activity: 'meditation'),
  Activities(emoji: '🛌🏻', activity: 'sleep'),
];

List<DayLog> logs = [
  DayLog(
      mood: Mood(mood: 'Happy'),
      date: DateTime.now(),
      activities: [
        Activities(activity: 'Workout', emoji: '🤼'),
        Activities(activity: 'Workout', emoji: '🤼'),
        Activities(activity: 'Workout', emoji: '🤼'),
      ],
      notesAndPhotos: NotesAndPhotos(notes: 'Today i worked out very good.')),
  DayLog(
      mood: Mood(mood: 'Happy'),
      date: DateTime.now(),
      activities: [
        Activities(activity: 'Workout', emoji: '🤼'),
        Activities(activity: 'Workout', emoji: '🤼'),
        Activities(activity: 'Workout', emoji: '🤼'),
      ],
      notesAndPhotos: NotesAndPhotos(notes: 'Today i worked out very good.')),
  DayLog(
      mood: Mood(mood: 'Happy'),
      date: DateTime.now(),
      activities: [
        Activities(activity: 'Workout', emoji: '🤼'),
        Activities(activity: 'Workout', emoji: '🤼'),
        Activities(activity: 'Workout', emoji: '🤼'),
      ],
      notesAndPhotos: NotesAndPhotos(notes: 'Today i worked out very good.')),
  DayLog(
      mood: Mood(mood: 'Happy'),
      date: DateTime.now(),
      activities: [
        Activities(activity: 'Workout', emoji: '🤼'),
        Activities(activity: 'Workout', emoji: '🤼'),
        Activities(activity: 'Workout', emoji: '🤼'),
      ],
      notesAndPhotos: NotesAndPhotos(notes: 'Today i worked out very good.')),
];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(DayLogAdapter());
  Hive.registerAdapter(ActivitiesAdapter());
  Hive.registerAdapter(MoodAdapter());
  Hive.registerAdapter(NotesAndPhotosAdapter());

  await Hive.openBox('logs');
  if (Hive.box('logs').isEmpty) {
    for (int i = 0; i < logs.length; i++) {
      Hive.box('logs').add(logs[i]);
      print(logs[i]);
    }
  } else {
    print("not empty");
  }
  await Hive.openBox('moods');
  if (Hive.box('moods').isEmpty) {
    for (int i = 0; i < moods.length; i++) {
      Hive.box('moods').add(moods[i]);
      print(moods[i]);
    }
  } else {
    print("not empty");
  }
  await Hive.openBox('activities');
  if (Hive.box('activities').isEmpty) {
    for (int i = 0; i < activities.length; i++) {
      Hive.box('activities').add(activities[i]);
      print(activities[i]);
    }
  } else {
    print("not empty");
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      print(Hive.box('logs').get(i));
    }
  }

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
