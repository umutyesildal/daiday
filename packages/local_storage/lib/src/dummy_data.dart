import 'package:local_storage/local_storage.dart';

class DummyData {
  List<String> moods = [
    'happy',
    'cheerful',
    'fine',
    'bad',
    'awful',
    'dizzy',
    'exhausted',
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
        date: '13.11.1997',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Today i worked out very good.'),
    DaylogHiveEntity(
        mood: 'Happy',
        date: '13.11.1997',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Today i worked out very good.'),
    DaylogHiveEntity(
        mood: 'Happy',
        date: '13.11.1997',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Today i worked out very good.'),
    DaylogHiveEntity(
        mood: 'Happy',
        date: '13.11.1997',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Today i worked out very good.'),
  ];
}
