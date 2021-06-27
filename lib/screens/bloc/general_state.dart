part of 'general_bloc.dart';

class GeneralState extends Equatable {
  const GeneralState({
    this.allDaylogs,
    this.isDaylogs = false,
  });

  final List<DaylogHiveEntity>? allDaylogs;
  final bool isDaylogs;

  GeneralState copywith({
    List<DaylogHiveEntity>? allDaylogs,
    bool? isDaylogs,
  }) {
    return GeneralState(
      allDaylogs: allDaylogs ?? this.allDaylogs,
      isDaylogs: isDaylogs ?? this.isDaylogs,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [allDaylogs, isDaylogs];
}

class GeneralInitial extends GeneralState {}
