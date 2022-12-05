import 'package:floor_flutter/database/note_dao.dart';
import 'package:floor_flutter/database/notetable.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final NoteDao noteDao;

  const MyHomePage(this.noteDao, {super.key});

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
            onPressed: () {
              noteDao.addNote(Note('Hello', 'Gello Gell'));
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.delete),
          )
        ],
      ),
      body: noteList(),
    );
  }

  Widget noteList() {
    return StreamBuilder<List<Note>>(
      builder: (context, data) {
        if (data.hasData) {
          return ListView.builder(
            itemCount: data.data!.length,
            itemBuilder: (context, position) {
              return ListTile(
                title: Text(data.data![position].title),
                subtitle: Text(data.data![position].message),
              );
            },
          );
        } else if (data.hasError) {
          return Text("Error");
        } else {
          return Text("loading");
        }
      },
      stream: noteDao.getAllNotes(),
    );
  }
}
