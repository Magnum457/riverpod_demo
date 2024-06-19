import "package:flutter/material.dart";
// import "package:flutter_riverpod/flutter_riverpod.dart";

// import "../providers/notes/notes_view_options.dart";

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/empty_notes.png'),
        const Text(
          "Tipo da nota",
        ),
      ],
    );
  }
}
