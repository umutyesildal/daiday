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
    }
  }

  Stream<GeneralState> _mapGetCompaniesState(
    GetDaylogsEvent event,
  ) async* {
    yield state.copywith(isDaylogs: false);
    try {
      List<DaylogHiveEntity>? allDaylogs = await daylogRepository.getDaylogs();
      print('Companies Got');
      yield state.copywith(isDaylogs: true, allDaylogs: allDaylogs);
      print(state.isDaylogs);
      print(allDaylogs![0].mood.toString());
    } catch (e) {
      print(e);
      print('Bloc error');
      yield state.copywith(isDaylogs: false);

      return;
    }
  }
}
