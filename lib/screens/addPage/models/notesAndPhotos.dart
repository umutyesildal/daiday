import 'package:hive/hive.dart';
part 'notesAndPhotos.g.dart';

@HiveType(typeId: 3)
class NotesAndPhotos {
  @HiveField(0)
  String notes;

  NotesAndPhotos({
    required this.notes,
  });
}
