import 'package:local_storage/local_storage.dart';
import 'package:intl/intl.dart';

class DummyData {
  List<String> moods = [
    'Happy',
    'Cheerful',
    'Fine',
    'Bad',
    'Awful',
    'Dizzy',
    'Exhausted',
  ];

  List<Activities> activities = [
    Activities(emoji: '🧳', activity: 'travel'),
    Activities(emoji: '💄', activity: 'makeup'),
    Activities(emoji: '🏋🏻', activity: 'workout'),
    Activities(emoji: '🚴🏻', activity: 'cycle'),
    Activities(emoji: '🧘🏻‍♂️', activity: 'meditation'),
    Activities(emoji: '🛌🏻', activity: 'sleep'),
  ];

  List<DaylogHiveEntity> logs = [
    DaylogHiveEntity(
        mood: 'Happy',
        date: DateFormat.yMd().format(DateTime.now()),
        activities: [
          Activities(activity: 'Started Improving myself', emoji: '😄'),
        ],
        notes: 'Today i downloaded Daiday!'),
  ];
}
