import 'package:web_skin_dart/ui_core.dart';
import 'package:web_skin_dart/ui_components.dart';
import 'models/note.dart';
import 'actions.dart';
import 'dart:math';

@Factory()
UiFactory<NotesSectionProps> NotesSection;

@Props()
class NotesSectionProps extends UiProps {
  List<Note> notes;
  DartDownActions actions;
  Note activeNote;
}

@State()
class NotesSectionState extends UiState {
  String searchTerm;
}

@Component()
class NotesSectionComponent extends UiStatefulComponent<NotesSectionProps, NotesSectionState> {
  @override
  render() {
    return (
      (BlockContent()
        ..className = 'notes-section--content'
        ..shrink = true
      )(
        (VBlock()
          ..shrink = true
          ..isNested = false
        )(
          (Block()
          )(
            (SearchInput()
              ..placeholder = 'Search Notes'
              ..hideLabel = true
            )(),
            (Button()
              ..onClick = (_) {
                _createNote(_);
//                props.actions.createNote(new Note(text: 'A new note!'));
              }
              ..className = 'new-button'
              ..isFlat = true
              ..noText = true
            )(
                (Icon()
                  ..className = 'plus-icon'
                  ..glyph = IconGlyph.PLUS
                  ..size = IconSize.MEDIUM
                )()
            ),
          ),
          ListGroup()(
            renderNotes()
          )
        ),
      )
    );
  }

  void _createNote(_) {
    if (props.actions != null) {
      props.actions.createNote(new Note(text: 'A new note!'));
//      props.actions.createNote(new Note(text: 'My first note!'));
    }
  }

  List renderNotes() {
    List notes = [];
    if (props != null && props.notes != null) {
      int index = 0;
      for (var note in props.notes) {
        var noteText = note.text;
        var previewEnd = min(14, noteText.length);
        var previewText = noteText.substring(0, previewEnd);
        previewText = previewText.isEmpty ? 'Untitled' : previewText;

        var listItem = (ListGroupItem()
          ..key = index
          ..targetKey = index++
          ..onSelect = _handleListSelect
          ..isActive = note == props.activeNote)(previewText);

        if (state.searchTerm != null && state.searchTerm.isNotEmpty &&
            !note.text.contains(state.searchTerm)){
          continue;
        }
        notes.add(listItem);
      }
    }

    return notes;
  }

  void _handleSearchValueChanged(SyntheticFormEvent event) {
    //Perform search/filter
    setState(newState()..searchTerm = event.target.value);
  }

  void _handleListSelect(SyntheticMouseEvent event, Object targetKey) {
    print('selecting new active');

    int targetKeyIndex = targetKey;
    if (targetKeyIndex >= 0 && targetKeyIndex < props.notes.length) {
      Note note = props.notes[targetKeyIndex];

      print('new active selected');

      props.actions.changeActiveNote(note);
    }
  }
}
