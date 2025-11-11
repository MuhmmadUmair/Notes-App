import 'package:flutter/material.dart';
import 'package:notes_app/constants/my_app_icons.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/view_model/note_provider.dart';
import 'package:notes_app/widgets/my_icon_widget.dart';
import 'package:provider/provider.dart';

// Add this widget file or below NotesScreen

class AddNotesBottomSheet extends StatefulWidget {
  const AddNotesBottomSheet({super.key});

  @override
  State<AddNotesBottomSheet> createState() => _AddNotesBottomSheetState();
}

class _AddNotesBottomSheetState extends State<AddNotesBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyTextController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyTextController.dispose();
    super.dispose();
  }

  void _save() {
    final title = _titleController.text.trim();
    final body = _bodyTextController.text.trim();

    if (title.isEmpty && body.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter Title or Body')),
      );
      return;
    }

    final note = NoteModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      bodyText: body,
      isPinned: false,
      isArchived: false,
      createdOn: DateTime.now(),
    );

    Provider.of<NoteProvider>(context, listen: false).addNotes(note);

    Navigator.of(context).pop(); // close bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to compute height when keyboard open
    final mq = MediaQuery.of(context);
    final sheetHeight = mq.size.height * 0.65;

    return GestureDetector(
      // tap outside sheet to dismiss
      onTap: () => Navigator.of(context).maybePop(),
      child: Container(
        color: Colors.black.withOpacity(0.4), // semi-transparent scrim
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: Container(
              height: sheetHeight,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: SingleChildScrollView(
                // ensure scroll when keyboard open
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyIconWidget(
                          icon: MyAppIcons.close,
                          function: () => Navigator.of(context).pop(),
                          backgroundColor: Colors.red,
                        ),
                        MyIconWidget(
                          icon: MyAppIcons.check,
                          function: _save,
                          backgroundColor: Colors.green,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffbfaf7ed),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text('Add Label'),
                    ),
                    const SizedBox(height: 20),
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
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add Title',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
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
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add note details...',
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
