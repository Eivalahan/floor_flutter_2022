import 'package:floor/floor.dart';

@Entity(tableName: 'note')
class Note {
  @PrimaryKey(autoGenerate: true)
  int? id;

  @ColumnInfo(name: 'title')
  String title;
  String message;

  Note({
    this.id,
    required this.title,
    required this.message,
  });
}
