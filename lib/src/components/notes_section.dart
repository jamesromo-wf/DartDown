import 'package:web_skin_dart/ui_core.dart';
import 'package:web_skin_dart/ui_components.dart';

@Factory()
UiFactory<NotesSectionProps> NotesSection;

@Props()
class NotesSectionProps extends UiProps {}

@State()
class NotesSectionState extends UiState {}

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
              ..onClick = _createNote
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
            ListGroupItem()('Test1'),
            ListGroupItem()('Test2'),
            ListGroupItem()('Test1'),
            ListGroupItem()('Test2'),
            ListGroupItem()('Test1'),
            ListGroupItem()('Test2'),
            ListGroupItem()('Test1'),
            ListGroupItem()('Test2'),
            ListGroupItem()('Test1'),
            ListGroupItem()('Test2'),
            ListGroupItem()('Test1'),
            ListGroupItem()('Test2'),
            ListGroupItem()('Test1'),
            ListGroupItem()('Test2'),
            ListGroupItem()('Test1'),
            ListGroupItem()('Test2'),
            ListGroupItem()('Test1'),
          )
        ),
      )
    );
  }

  void _createNote(_) {
//    if (props.actions != null) {
//      props.actions.createNote(new Note(text: 'My first note!'));
//    }
  }
}
