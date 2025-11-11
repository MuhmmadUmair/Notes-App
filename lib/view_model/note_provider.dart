import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/repository/note_database.dart';

class NoteProvider extends ChangeNotifier {
  final List<NoteModel> _notes = [];
  final NoteDatabase _db = NoteDatabase();

  List<NoteModel> get notes => _notes;

  NoteProvider() {
    // Load DB (box must already be opened in main)
    _db.loadDatabase();
    _notes.addAll(_db.notesList);
  }

  void addNotes(NoteModel note) {
    _notes.add(note);
    _db.notesList = _notes;
    _db.updateDatabase(); // important — actually write to Hive
    notifyListeners();
  }

  bool deleteNoteById(int id) {
    final before = _notes.length;
    _notes.removeWhere((note) => note.id == id);
    final after = _notes.length;
    final removed = before - after;
    if (removed == 0) {
      print('deleteNoteById: nothing removed for id=$id');
      return false;
    }

    _db.notesList = _notes;
    _db.updateDatabase();
    notifyListeners();
    print('deleteNoteById: removed $removed note(s) with id=$id');
    return true;
  }

  String formatDate(DateTime dt) {
    try {
      return DateFormat.yMMMMd().format(dt);
    } catch (_) {
      return '${dt.day}/${dt.month}/${dt.year}';
    }
  }
}
