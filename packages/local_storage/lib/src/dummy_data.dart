import 'package:local_storage/local_storage.dart';

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
        date: '21/06/2021',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Today i worked out very good.'),
    DaylogHiveEntity(
        mood: 'Happy',
        date: '22/06/2021',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Today i ate very good.'),
    DaylogHiveEntity(
        mood: 'Exhausted',
        date: '23/06/2021',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Today work was very stresfull'),
    DaylogHiveEntity(
        mood: 'Sad',
        date: '24/06/2021',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Still stresfull, i have to check this issue'),
    DaylogHiveEntity(
        mood: 'Sad',
        date: '25/06/2021',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'I am dead.'),
    DaylogHiveEntity(
        mood: 'Sad',
        date: '26/06/2021',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Meh day'),
    DaylogHiveEntity(
        mood: 'Sad',
        date: '27/06/2021',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'I just want this week to be overr.'),
    DaylogHiveEntity(
        mood: 'Exhausted',
        date: '28/06/2021',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Finally a day to relax'),
    DaylogHiveEntity(
        mood: 'Awful',
        date: '29/06/2021',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'Again i have to work?'),
    DaylogHiveEntity(
        mood: 'Happy',
        date: '30/06/2021',
        activities: [
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
          Activities(activity: 'Workout', emoji: '🤼'),
        ],
        notes: 'I met someone!!'),
  ];
}
