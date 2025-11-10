import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';

class NoteDatabase {
  List<NoteModel> notesList = [];
  final _myBox = Hive.box('MyBox');
  final String noteKey = 'NoteKey';

  // Initial data
  void initalDB() {
    notesList = [
      NoteModel(
        id: 1,
        title: 'Title',
        bodyText: "This is the body text ",
        isPinned: false,
        isArchived: false,
        createdOn: DateTime.now(),
      ),
      NoteModel(
        id: 2,
        title: 'New Title',
        bodyText:
            "The Stateless Widgets are static, and the Stateful Widgets are dynamic.",
        isPinned: false,
        isArchived: false,
        createdOn: DateTime.now(),
      ),
    ];
    updateDatabase(); // Save to Hive
  }

  // Load notes from Hive
  void loadDatabase() {
    final stored = _myBox.get(noteKey, defaultValue: []);
    // If using adapter, cast directly
    notesList = (stored as List).cast<NoteModel>();
  }

  // Save notes to Hive
  void updateDatabase() {
    _myBox.put(noteKey, notesList);
  }

  // Clear all notes
  void clearDatabase() {
    notesList.clear();
    updateDatabase();
  }
}
