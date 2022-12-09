import 'package:floor/floor.dart';
import 'package:floor_flutter/database/notetable.dart';

@dao
abstract class NoteDao {
  @Query('select * from note')
  Stream<List<Note>> getAllNotes();

  @insert
  Future<void> addNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deleteAllNote(List<Note> note);
}
