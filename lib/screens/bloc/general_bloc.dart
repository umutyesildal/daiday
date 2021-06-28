import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:local_storage/local_storage.dart';
import 'package:equatable/equatable.dart';
part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc({required this.daylogRepository}) : super(GeneralInitial());
  final DaylogStorage daylogRepository;
  @override
  Stream<GeneralState> mapEventToState(
    GeneralEvent event,
  ) async* {
    if (event is GetDaylogsEvent) {
      yield* _mapGetCompaniesState(
        event,
      );
    } else if (event is GetSelectedMood) {
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
    } else if (event is GetSelectedActivities) {
      yield* _mapSelectActivitiesState(
        event,
      );
    } else if (event is GetSelectedNote) {
      yield* _mapSelectNoteState(
        event,
      );
    }
  }

  Stream<GeneralState> _mapGetCompaniesState(
    GetDaylogsEvent event,
  ) async* {
    yield state.copywith(isDaylogs: false);
    try {
      List<DaylogHiveEntity>? allDaylogs = await daylogRepository.getDaylogs();
      List<Activities>? allActivities = await daylogRepository.getActivities();
      List<String>? allMoods = await daylogRepository.getMoods();

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

  Stream<GeneralState> _mapSelectMoodState(
    GetSelectedMood event,
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

  Stream<GeneralState> _mapSelectNoteState(
    GetSelectedNote event,
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

  Stream<GeneralState> _mapSelectActivitiesState(
    GetSelectedActivities event,
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

  Stream<GeneralState> _mapAddDayLogState(
    AddDaylogEvent event,
  ) async* {
    try {
      DaylogHiveEntity newEntity = DaylogHiveEntity(
          mood: state.selectedMood!,
          date: DateTime.now().weekday.toString(),
          activities: state.selectedActivities!,
          notes: state.selectedNote!);
      await daylogRepository.putDaylog(daylogHiveEntity: newEntity);
    } catch (e) {
      print(e);
      print('Add Log Error');
      return;
    }
  }

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
