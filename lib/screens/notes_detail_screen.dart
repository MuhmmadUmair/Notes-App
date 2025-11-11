import 'package:flutter/material.dart';
import 'package:notes_app/constants/my_app_icons.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/notes_screen.dart';
import 'package:notes_app/view_model/note_provider.dart';
import 'package:notes_app/widgets/my_icon_widget.dart';
import 'package:provider/provider.dart';

class NotesDetailScreen extends StatelessWidget {
  final NoteModel note;
  const NotesDetailScreen({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NoteProvider>(context);
    final sheetHeight = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          NotesScreen(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesScreen()),
              );
            },
            child: Container(color: Colors.black.withOpacity(0.6)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: sheetHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // top action icons
                    Row(
                      children: [
                        Transform.rotate(
                          angle: 0.8,
                          child: MyIconWidget(
                            icon: MyAppIcons.pin,
                            function: () {},
                            backgroundColor: const Color(0xffbad6139),
                          ),
                        ),
                        const SizedBox(width: 12),
                        MyIconWidget(
                          icon: MyAppIcons.edit,
                          function: () {
                            // navigate to edit screen (pass note)
                          },
                          backgroundColor: const Color(0xffb314290),
                        ),
                        const SizedBox(width: 12),
                        MyIconWidget(
                          icon: MyAppIcons.search,
                          function: () {},
                          backgroundColor: Colors.green,
                        ),
                        const Spacer(),
                        MyIconWidget(
                          icon: MyAppIcons.delete,
                          function: () {
                            // delete from provider and pop
                            notesProvider.deleteNoteById(note.id);
                            Navigator.pop(context);
                          },
                          backgroundColor: Colors.red,
                        ),
                      ],
                    ),

                    // optional category chip
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffbfaf7ed),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('Notes'),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // title
                    Text(
                      note.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // date (from model)
                    Text(
                      notesProvider.formatDate(note.createdOn),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // body
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          note.bodyText,
                          style: const TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
