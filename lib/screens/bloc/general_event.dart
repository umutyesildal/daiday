part of 'general_bloc.dart';

@immutable
abstract class GeneralEvent extends Equatable {}

class GetDaylogsEvent extends GeneralEvent {
  GetDaylogsEvent();

  @override
  List<Object> get props => [];
}
