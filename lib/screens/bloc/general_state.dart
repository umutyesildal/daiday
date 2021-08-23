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
    this.isActivitiesSelected = false,
    this.theme,
    this.name,
  });

  final List<DaylogHiveEntity>? allDaylogs;
  final List<DaylogHiveEntity>? logsToDisplay;
  final List<Activities>? allActivities;
  final List<Activities>? selectedActivities;
  final List<String>? allMoods;
  final String? selectedMood;
  final String? selectedNote;
  final String? name;
  final bool isDaylogs;
  final bool isActivitiesSelected;
  final bool? theme;

  GeneralState copywith({
    List<DaylogHiveEntity>? allDaylogs,
    List<DaylogHiveEntity>? logsToDisplay,
    List<Activities>? allActivities,
    List<Activities>? selectedActivities,
    List<String>? allMoods,
    String? selectedMood,
    String? selectedNote,
    bool? isDaylogs,
    bool? isActivitiesSelected,
    bool? theme,
    String? name,
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
      isActivitiesSelected: isActivitiesSelected ?? this.isActivitiesSelected,
      theme: theme ?? this.theme,
      name: name ?? this.name,
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
        isDaylogs,
        isActivitiesSelected,
        theme,
        name
      ];
}

class GeneralInitial extends GeneralState {}
