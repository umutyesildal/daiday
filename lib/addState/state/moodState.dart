import 'package:daiday/screens/addPage/addPage.dart';
import 'package:flutter/material.dart';

class MoodState with ChangeNotifier {
  DayLog? _daylog;
  Mood? _mood;
  List<Activities> _activities = [];
  NotesAndPhotos? _notesAndPhotos;
  NotesAndPhotos get notesAndPhotos => _notesAndPhotos!;
  List<Activities> get activities => _activities;
  Mood get moods => _mood!;
  DayLog get daylogs => _daylog!;

  addMood(Mood mood) {
    print(mood.mood);
    _mood = mood;
    print(_mood);
    notifyListeners();
  }

  addActivities(List<Activities> activities) {
    _activities = activities;
    print(_activities.length);
    notifyListeners();
  }

  addNotesAndPhotos(NotesAndPhotos notesAndPhotos) {
    _notesAndPhotos = notesAndPhotos;
    print(notesAndPhotos.notes);
    notifyListeners();
  }

  deleteItem() {
    notifyListeners();
  }
}
