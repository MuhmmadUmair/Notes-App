// note_model_adapter.dart
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';

class NoteModelAdapter extends TypeAdapter<NoteModel> {
  @override
  final int typeId = 1; // keep unique across your adapters

  @override
  NoteModel read(BinaryReader reader) {
    final id = reader.readInt();
    final title = reader.readString();
    final bodyText = reader.readString();
    final isPinned = reader.readBool();
    final isArchived = reader.readBool();
    final createdOnMillis = reader.readInt();
    return NoteModel(
      id: id,
      title: title,
      bodyText: bodyText,
      isPinned: isPinned,
      isArchived: isArchived,
      createdOn: DateTime.fromMillisecondsSinceEpoch(createdOnMillis),
    );
  }

  @override
  void write(BinaryWriter writer, NoteModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.bodyText);
    writer.writeBool(obj.isPinned);
    writer.writeBool(obj.isArchived);
    writer.writeInt(obj.createdOn.millisecondsSinceEpoch);
  }
}
