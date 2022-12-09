import 'package:floor_flutter/database/note_dao.dart';
import 'package:floor_flutter/database/notetable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);
  final TextEditingController title = TextEditingController();
  final TextEditingController messages = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Screen'),
        ),
        body: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: title,
                decoration: const InputDecoration(
                  hintText: 'Tittle',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: messages,
                decoration: const InputDecoration(
                  hintText: 'Tittle',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  noteDao.addNote(
                    Note(title: title.text, message: messages.text),
                  );
                  Get.back();
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ));
  }
}
