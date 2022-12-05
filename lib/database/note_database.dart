
import 'package:floor/floor.dart';
import 'package:floor_flutter/database/note_dao.dart';
import 'package:floor_flutter/database/notetable.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'note_database.g.dart';
@Database(version: 1, entities:[Note])
abstract class NoteDatabase extends FloorDatabase{
  NoteDao get noteDao;

}