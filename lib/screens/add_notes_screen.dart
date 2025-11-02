import 'package:flutter/material.dart';
import 'package:notes_app/constants/my_app_icons.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/notes_screen.dart';
import 'package:notes_app/view_model/note_provider.dart';
import 'package:notes_app/widgets/my_icon_widget.dart';
import 'package:provider/provider.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyTextController = TextEditingController();
  void _save() {
    final title = _titleController.text.trim();
    final body = _bodyTextController.text.trim();

    if (title.isEmpty && body.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please Enter Title or Body')));
      return;
    }
    final note = NoteModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      bodyText: body,
      isPinned: false,
      isArchived: false,
      createdAt: DateTime.now(),
    );
    final notesProvider = Provider.of<NoteProvider>(
      context,
      listen: false,
    ).addNotes(note);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const NotesScreen(),
          Container(color: Colors.black.withValues(alpha: 0.6)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(25),
              height: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyIconWidget(
                          icon: MyAppIcons.close,
                          function: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: Colors.red,
                        ),
                        MyIconWidget(
                          icon: MyAppIcons.check,
                          function: _save,
                          backgroundColor: Colors.green,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Color(0xffbFAF7ED),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Add Label'),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hint: Text('Add Title'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: _bodyTextController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hint: Text('Add note details...'),
                          ),
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
