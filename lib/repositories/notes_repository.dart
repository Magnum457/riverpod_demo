import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/notes/notes_view_options.dart';
import '../providers/notes/view_filtered_provider.dart';

import '../models/note.dart';

final notesRepositoryProvider =
    StateNotifierProvider<NotesRepository, List<Note>>(
  (ref) => NotesRepository(),
);

final notesListProvider = Provider((ref) {
  final NotesViewOptions viewOption = ref.watch(filterNotesProvider).value;
  final List<Note> notes = ref.watch(notesRepositoryProvider);

  if (viewOption == NotesViewOptions.inbox) {
    return notes.where((note) => !note.archived).toList();
  }
  return notes.where((note) => note.archived).toList();
});

class NotesRepository extends StateNotifier<List<Note>> {
  NotesRepository() : super([]);

  addNote(Note note) {
    state = [...state, note];
  }

  archiveNote(Note note) {
    final updateNote = note.copyWith(archived: true);
    state.remove(note);
    state = [updateNote, ...state];
  }

  moveNoteToInbox(Note note) {
    final updateNote = note.copyWith(archived: false);
    state.remove(note);
    state = [updateNote, ...state];
  }
}
