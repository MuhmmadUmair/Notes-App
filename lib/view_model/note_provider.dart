import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

class NoteProvider extends ChangeNotifier {
  final List<NoteModel> _notes = [];
  List<NoteModel> get notes => _notes;

  void addNotes(NoteModel note) {
    _notes.add(note);
    notifyListeners();
  }
}
