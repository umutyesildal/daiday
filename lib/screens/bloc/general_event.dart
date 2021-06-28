part of 'general_bloc.dart';

@immutable
abstract class GeneralEvent extends Equatable {}

class GetDaylogsEvent extends GeneralEvent {
  GetDaylogsEvent();

  @override
  List<Object> get props => [];
}

class AddDaylogsEvent extends GeneralEvent {
  AddDaylogsEvent();

  @override
  List<Object> get props => [];
}

class AddDaylogEvent extends GeneralEvent {
  AddDaylogEvent();

  @override
  List<Object> get props => [];
}

class GetSelectedMood extends GeneralEvent {
  GetSelectedMood({required this.mood});
  final String mood;

  @override
  List<Object> get props => [mood];
}

class GetSelectedNote extends GeneralEvent {
  GetSelectedNote({required this.note});
  final String note;

  @override
  List<Object> get props => [note];
}

class GetSelectedActivities extends GeneralEvent {
  GetSelectedActivities({required this.activities});
  final List<Activities> activities;

  @override
  List<Object> get props => [activities];
}

class SearchQueryChangedEvent extends GeneralEvent {
  SearchQueryChangedEvent({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}
