import 'package:floor_flutter/add_screen.dart';
import 'package:floor_flutter/database/note_dao.dart';
import 'package:floor_flutter/database/notetable.dart';
import 'package:floor_flutter/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  final NoteDao noteDao = Get.find();
  List<Note> note = [];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floor Database"),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "Add",
            onPressed: () {
              Get.to(AddScreen());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "Delete",
            onPressed: () {
              noteDao.deleteAllNote(note);
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
      body: noteList(),
    );
  }

  Widget noteList() {
    return StreamBuilder<List<Note>>(
      builder: (context, data) {
        note = data.data!;
        if (data.hasData) {
          return ListView.builder(
            itemCount: data.data!.length,
            itemBuilder: (context, position) {
              return ListTile(
                title: Text(data.data![position].title),
                subtitle: Text(data.data![position].message),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    noteDao.deleteNote(data.data![position]);
                  },
                ),
                leading: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => Get.to(
                    UpdateScreen(),
                    arguments: data.data![position],
                  ),
                ),
              );
            },
          );
        } else if (data.hasError) {
          return const Text("Error");
        } else {
          return const Text("loading");
        }
      },
      stream: noteDao.getAllNotes(),

    );
  }
}
