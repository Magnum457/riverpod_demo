import 'package:flutter/material.dart';

import '../../models/note.dart';
import '../../pages/note_details_page.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NoteDetailsPage(note: note),
          ),
        ),
        borderRadius: BorderRadius.circular(8),
        splashColor: note.color.shade100,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 150,
                  maxWidth: 0,
                ),
                clipBehavior: Clip.none,
                child: Text(
                  note.description,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
