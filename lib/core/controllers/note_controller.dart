import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/db/db_helper.dart';
import 'package:flutter_note_app/core/models/note_model.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  final noteList = [].obs;

  @override
  void onReady() {
    getNotes();
    super.onReady();
  }

  Future<void> addNote({@required Note note}) async {
    return await DBHelper.insert(note);
  }

  Future<void> getNotes() async {
    List<Map<String, dynamic>> notes = await DBHelper.query();
    noteList.assignAll(notes.map((data) => Note.fromJson(data)).toList());
  }

  Future<void> deleteNote({@required Note note}) async {
    await DBHelper.delete(note);
    getNotes();
  }

  Future<void> updateNote({@required Note note}) async {
    await DBHelper.update(note);
    getNotes();
  }
}
