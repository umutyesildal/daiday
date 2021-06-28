part of 'general_bloc.dart';

class GeneralState extends Equatable {
  const GeneralState({
    this.allDaylogs,
    this.allMoods,
    this.allActivities,
    this.selectedMood,
    this.isDaylogs = false,
  });

  final List<DaylogHiveEntity>? allDaylogs;
  final List<Activities>? allActivities;
  final List<String>? allMoods;
  final String? selectedMood;
  final bool isDaylogs;

  GeneralState copywith({
    List<DaylogHiveEntity>? allDaylogs,
    List<Activities>? allActivities,
    List<String>? allMoods,
    String? selectedMood,
    bool? isDaylogs,
  }) {
    return GeneralState(
      allDaylogs: allDaylogs ?? this.allDaylogs,
      allActivities: allActivities ?? this.allActivities,
      allMoods: allMoods ?? this.allMoods,
      selectedMood: selectedMood ?? this.selectedMood,
      isDaylogs: isDaylogs ?? this.isDaylogs,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [allDaylogs, allMoods, allActivities, selectedMood, isDaylogs];
}

class GeneralInitial extends GeneralState {}
