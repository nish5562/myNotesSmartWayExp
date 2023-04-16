import 'package:hive/hive.dart';

part 'note_structure.g.dart';

@HiveType(typeId: 1)
class NoteStructure extends HiveObject {
  NoteStructure({required this.heading, required this.note});

  @HiveField(0)
  String heading;

  @HiveField(1)
  String note;
}
