import 'package:floor/floor.dart';
import 'package:floor_flutter/database/notetable.dart';

@dao
abstract class NoteDao{
  @Query('select * from note')
  Stream<List<Note>> getAllNotes();

  @insert
  Future<void> addNote(Note note)async {

  }
}