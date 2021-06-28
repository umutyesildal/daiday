part of 'general_bloc.dart';

@immutable
abstract class GeneralEvent extends Equatable {}

class GetDaylogsEvent extends GeneralEvent {
  GetDaylogsEvent();

  @override
  List<Object> get props => [];
}

class GetSelectedMood extends GeneralEvent {
  GetSelectedMood({required this.mood});
  final String mood;

  @override
  List<Object> get props => [mood];
}
