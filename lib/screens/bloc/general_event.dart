part of 'general_bloc.dart';

///Events represents actions in bloc. To trigger a method first you need an event.

@immutable
abstract class GeneralEvent extends Equatable {}

class GetDaylogsEvent extends GeneralEvent {
  GetDaylogsEvent();

  @override
  List<Object> get props => [];
}

class GetNameEvent extends GeneralEvent {
  GetNameEvent();

  @override
  List<Object> get props => [];
}

class ChangeNameEvent extends GeneralEvent {
  ChangeNameEvent({required this.name});
  final String name;
  @override
  List<Object> get props => [name];
}

class GetThemeEvent extends GeneralEvent {
  GetThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends GeneralEvent {
  ChangeThemeEvent({required this.theme});
  final bool theme;
  @override
  List<Object> get props => [theme];
}

class AddDaylogEvent extends GeneralEvent {
  AddDaylogEvent();

  @override
  List<Object> get props => [];
}

class AddMoodEvent extends GeneralEvent {
  AddMoodEvent({required this.mood});
  final String mood;

  @override
  List<Object> get props => [mood];
}

class AddActivitiesEvent extends GeneralEvent {
  AddActivitiesEvent({required this.activity, required this.emoji});
  final String activity;
  final String emoji;

  @override
  List<Object> get props => [activity, emoji];
}

class GetSelectedMoodEvent extends GeneralEvent {
  GetSelectedMoodEvent({required this.mood});
  final String mood;

  @override
  List<Object> get props => [mood];
}

class GetSelectedNoteEvent extends GeneralEvent {
  GetSelectedNoteEvent({required this.note});
  final String note;

  @override
  List<Object> get props => [note];
}

class AddSelectedActivitiesEvent extends GeneralEvent {
  AddSelectedActivitiesEvent({required this.activities});
  final Activities activities;

  @override
  List<Object> get props => [activities];
}

class DeleteSelectedActivitiesEvent extends GeneralEvent {
  DeleteSelectedActivitiesEvent({required this.activities});
  final Activities activities;

  @override
  List<Object> get props => [activities];
}

class SearchQueryChangedEvent extends GeneralEvent {
  SearchQueryChangedEvent({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}
