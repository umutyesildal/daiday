import 'package:daiday/screens/addPage/addPage.dart';
import 'package:flutter/material.dart';

class MoodState with ChangeNotifier {
  Mood? _mood;
  NotesAndPhotos? _notesAndPhotos;
  NotesAndPhotos get notesAndPhotos => _notesAndPhotos!;
  Mood get moods => _mood!;

  addMood(Mood mood) {
    print(mood.mood);
    _mood = mood;
    print(_mood);
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
