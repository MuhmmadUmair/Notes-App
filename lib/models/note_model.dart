// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NoteModel {
  final int id;
  final String title;
  final String bodyText;
  // final List<String> labels;
  final bool isPinned;
  final bool isArchived;
  final DateTime createdAt;
  // final DateTime updatedAt;
  // final Color color;
  NoteModel({
    required this.id,
    required this.title,
    required this.bodyText,
    // required this.labels,
    required this.isPinned,
    required this.isArchived,
    required this.createdAt,
    // required this.updatedAt,
    // required this.color,
  });

  NoteModel copyWith({
    int? id,
    String? title,
    String? bodyText,
    // List<String>? labels,
    bool? isPinned,
    bool? isArchived,
    DateTime? createdAt,
    // DateTime? updatedAt,
    // Color? color,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      bodyText: bodyText ?? this.bodyText,
      // labels: labels ?? this.labels,
      isPinned: isPinned ?? this.isPinned,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      // updatedAt: updatedAt ?? this.updatedAt,
      // color: color ?? this.color,
    );
  }
}
