import "package:flutter/material.dart";

import "../models/note.dart";

class NoteDetailsPage extends StatelessWidget {
  final Note note;

  const NoteDetailsPage({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: note.color.shade50,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: ListView(
          children: [
            Text(
              note.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(height: 36),
            Text(note.description),
          ],
        ),
      ),
    );
  }
}
