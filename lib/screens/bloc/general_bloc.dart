import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:local_storage/local_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'general_event.dart';
part 'general_state.dart';

// Root of the bloc, all the methods are here.
class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc({required this.daylogRepository}) : super(GeneralInitial());
  final DaylogStorage daylogRepository;
  @override
  Stream<GeneralState> mapEventToState(
    GeneralEvent event,
  ) async* {
    if (event is GetDaylogsEvent) {
      yield* _mapGetDaylogsState(
        event,
      );
    } else if (event is GetSelectedMoodEvent) {
      yield* _mapSelectMoodState(
        event,
      );
    } else if (event is AddDaylogEvent) {
      yield* _mapAddDayLogState(
        event,
      );
    } else if (event is SearchQueryChangedEvent) {
      yield* _mapSearchQueryChangedToState(
        event,
      );
    } else if (event is GetSelectedActivitiesEvent) {
      yield* _mapSelectActivitiesState(
        event,
      );
    } else if (event is GetSelectedNoteEvent) {
      yield* _mapSelectNoteState(
        event,
      );
    } else if (event is AddMoodEvent) {
      yield* _mapAddMoodState(
        event,
      );
    } else if (event is AddActivitiesEvent) {
      yield* _mapAddActivitiesState(
        event,
      );
    }
  }

// Getting datas from database.
  Stream<GeneralState> _mapGetDaylogsState(
    GetDaylogsEvent event,
  ) async* {
    yield state.copywith(isDaylogs: false);
    try {
      List<DaylogHiveEntity>? allDaylogs = await daylogRepository.getDaylogs();
      List<Activities>? allActivities = await daylogRepository.getActivities();
      List<String>? allMoods = await daylogRepository.getMoods();
// writing datas to state.
      yield state.copywith(
          isDaylogs: true,
          allDaylogs: allDaylogs,
          logsToDisplay: allDaylogs,
          allActivities: allActivities,
          allMoods: allMoods);
      print(state.isDaylogs);
      print(allDaylogs![0].mood.toString());
    } catch (e) {
      print(e);
      print('Bloc error');
      yield state.copywith(isDaylogs: false);
      return;
    }
  }

  // updating the selected mood when user taps to a mood.
  Stream<GeneralState> _mapSelectMoodState(
    GetSelectedMoodEvent event,
  ) async* {
    try {
      String selectedMood = event.mood;
      yield state.copywith(selectedMood: selectedMood);
    } catch (e) {
      print(e);
      print('Selected Mood Error');
      return;
    }
  }

  // updating the selected note when user writes a note.
  Stream<GeneralState> _mapSelectNoteState(
    GetSelectedNoteEvent event,
  ) async* {
    try {
      String selectedNote = event.note;
      yield state.copywith(selectedNote: selectedNote);
    } catch (e) {
      print(e);
      print('Selected Note Error');
      return;
    }
  }
  // updating the selected activity when user taps to a activity.

  Stream<GeneralState> _mapSelectActivitiesState(
    GetSelectedActivitiesEvent event,
  ) async* {
    try {
      List<Activities> selectedActivities = event.activities;
      yield state.copywith(selectedActivities: selectedActivities);
    } catch (e) {
      print(e);
      print('Selected Activities Error');
      return;
    }
  }

// Adding a Daylog to database.
  Stream<GeneralState> _mapAddDayLogState(
    AddDaylogEvent event,
  ) async* {
    try {
      DaylogHiveEntity newEntity = DaylogHiveEntity(
          mood: state.selectedMood!,
          date: DateFormat.yMd().format(DateTime.now()),
          activities: state.selectedActivities!,
          notes: state.selectedNote!);
      print(newEntity.date);
      print(newEntity.mood);
      print(newEntity.notes);
      print(newEntity.activities[0]);

      print('Add Bloc');
      await daylogRepository.putDaylog(daylogHiveEntity: newEntity);
      state.allDaylogs!.add(newEntity);
      state.logsToDisplay!.add(newEntity);
    } catch (e) {
      print(e);
      print('Add Log Error');
      return;
    }
  }

// adding a mood to Database
  Stream<GeneralState> _mapAddMoodState(
    AddMoodEvent event,
  ) async* {
    try {
      print('Add Mood');
      await daylogRepository.putMood(mood: event.mood);
      state.allMoods!.add(event.mood);
    } catch (e) {
      print(e);
      print('Add Mood Error');
      return;
    }
  }

// adding an activity to database
  Stream<GeneralState> _mapAddActivitiesState(
    AddActivitiesEvent event,
  ) async* {
    try {
      print('Add Activity');
      Activities activity =
          Activities(activity: event.activity, emoji: event.emoji);
      await daylogRepository.putActivities(activities: activity);
      state.allActivities!.add(activity);
    } catch (e) {
      print(e);
      print('Add Activity Error');
      return;
    }
  }

// updating logsToDisplay by query
  Stream<GeneralState> _mapSearchQueryChangedToState(
    SearchQueryChangedEvent event,
  ) async* {
    print('We are changing logsToDisplay');
    List<DaylogHiveEntity> daylogsToDisplay = state.allDaylogs!.where((log) {
      var logData = log.notes.toLowerCase();
      return logData.contains(event.query);
    }).toList();
    yield state.copywith(logsToDisplay: daylogsToDisplay);
  }
}
