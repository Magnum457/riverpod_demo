import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notes_view_options.dart';

final notesViewModeProvider = ChangeNotifierProvider(
  (ref) => NotesViewModeProvider(NotesViewOptions.grid),
);

class NotesViewModeProvider extends ValueNotifier<NotesViewOptions> {
  NotesViewModeProvider(super.mode);

  toogle() {
    value = value == NotesViewOptions.column
        ? NotesViewOptions.grid
        : NotesViewOptions.column;
  }
}
