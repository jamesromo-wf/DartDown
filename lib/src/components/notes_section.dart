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
          (SearchInput()
            ..placeholder = 'Search Notes'
            ..hideLabel = true
          )(),
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
}
