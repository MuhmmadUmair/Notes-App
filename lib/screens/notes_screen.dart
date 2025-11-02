import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/screens/notes_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/view_model/note_provider.dart';
import 'package:notes_app/widgets/notes_widget.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/add_notes_screen.dart';
import 'package:notes_app/constants/my_app_icons.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    final notes = noteProvider.notes;

    // responsive column count (optional)
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 600 ? 3 : 2;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffb0e435a),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddNotesScreen()),
          );
        },
        child: const Icon(MyAppIcons.add, color: Colors.white),
      ),
      appBar: AppBar(
        title: const Text('Notes', style: TextStyle(color: Color(0xffb0e435a))),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(MyAppIcons.search)),
          IconButton(onPressed: () {}, icon: const Icon(MyAppIcons.list)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: MasonryGridView.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final NoteModel note = notes[index];
            return GestureDetector(
              child: NotesWidget(title: note.title, bodyText: note.bodyText),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotesDetailScreen()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
