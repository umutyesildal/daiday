part of 'general_bloc.dart';

/// State have variables that can be changed and reached from anywhere in the project.
class GeneralState extends Equatable {
  const GeneralState({
    this.allDaylogs,
    this.logsToDisplay,
    this.allMoods,
    this.allActivities,
    this.selectedMood,
    this.selectedActivities,
    this.selectedNote,
    this.isDaylogs = false,
  });

  final List<DaylogHiveEntity>? allDaylogs;
  final List<DaylogHiveEntity>? logsToDisplay;
  final List<Activities>? allActivities;

  final List<Activities>? selectedActivities;
  final List<String>? allMoods;
  final String? selectedMood;
  final String? selectedNote;

  final bool isDaylogs;

  GeneralState copywith({
    List<DaylogHiveEntity>? allDaylogs,
    List<DaylogHiveEntity>? logsToDisplay,
    List<Activities>? allActivities,
    List<Activities>? selectedActivities,
    List<String>? allMoods,
    String? selectedMood,
    String? selectedNote,
    bool? isDaylogs,
  }) {
    return GeneralState(
      allDaylogs: allDaylogs ?? this.allDaylogs,
      logsToDisplay: logsToDisplay ?? this.logsToDisplay,
      allActivities: allActivities ?? this.allActivities,
      allMoods: allMoods ?? this.allMoods,
      selectedActivities: selectedActivities ?? this.selectedActivities,
      selectedMood: selectedMood ?? this.selectedMood,
      selectedNote: selectedNote ?? this.selectedNote,
      isDaylogs: isDaylogs ?? this.isDaylogs,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        allDaylogs,
        logsToDisplay,
        allMoods,
        allActivities,
        selectedActivities,
        selectedMood,
        selectedNote,
        isDaylogs
      ];
}

class GeneralInitial extends GeneralState {}
