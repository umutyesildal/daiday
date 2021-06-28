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
}
