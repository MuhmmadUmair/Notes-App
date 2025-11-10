import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/screens/notes_screen.dart';
import 'package:notes_app/services/note_adopter.dart';
import 'package:notes_app/view_model/note_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Register adapter BEFORE opening any boxes
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(NoteModelAdapter());
  }
  await Hive.openBox('MyBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteProvider(),
      child: MaterialApp(
        title: 'Notes App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: NotesScreen(),
      ),
    );
  }
}
