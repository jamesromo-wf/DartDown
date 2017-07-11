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
  var modalTriggerRef;
  String noteTitle = 'Untitled';

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
                _showCreateNoteModal();
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
            (ModalTrigger()
              ..ref = (instance) { modalTriggerRef = instance; }
              ..modal = (Modal()
              ..header = 'Create New Note'
              ..backdropType = ModalBackdropType.DEFAULT
            )(
              DialogBody()(
                (TextInput()
                  ..type = TextInputType.TEXT
                  ..placeholder = 'Enter new note title'
                  ..label = 'Note title'
                  ..hideLabel = true
                  ..onChange = ((event) => noteTitle = event.target.value)
//                    setState({'value': event.target.value}))
                )(),
              ),
              DialogFooter()(
                (Button()
                  ..onClick = (SyntheticMouseEvent event) {
                    modalTriggerRef.hide();
//                            modalTriggerRef.props.onRequestHide(event);
                  }
                )('Cancel'),
                (Button()
                  ..skin = ButtonSkin.PRIMARY
                  ..onClick = (SyntheticMouseEvent event) {
                    modalTriggerRef.hide();
                    _createNote(noteTitle);
//                            modalTriggerRef.props.onRequestHide(event);
                  }
                )('Create')
                )
            ))()
          ),
          ListGroup()(
            renderNotes()
          )
        ),
      )
    );
  }

  void _showCreateNoteModal() {
    modalTriggerRef.toggle();
  }

  void _createNote(String noteTitle) {
    if (props.actions != null) {
      props.actions.createNote(new Note(text: noteTitle));
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
            !note.text.contains(state.searchTerm)) {
          continue;
        }
        notes.add(listItem);
      }
    }

    return notes;
  }

  void _handleSearchValueChanged(SyntheticFormEvent event) {
    setState(newState()..searchTerm = event.target.value);
  }

  void _handleListSelect(SyntheticMouseEvent event, Object targetKey) {
    int targetKeyIndex = targetKey;
    if (targetKeyIndex >= 0 && targetKeyIndex < props.notes.length) {
      Note note = props.notes[targetKeyIndex];

      print('new active selected');

      props.actions.changeActiveNote(note);
    }
  }
}
