import 'package:floor_flutter/database/note_database.dart';
import 'package:floor_flutter/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<NoteDatabase>(
        builder: (context, data) {
          if (data.hasData) {
            Get.put(data.data!.noteDao);
            return  MyHomePage();
          } else if (data.hasError) {
            return const Text('Error');
          } else {
            return const Text('Loading');
          }
        },
        future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
      ),
    );
  }
}
