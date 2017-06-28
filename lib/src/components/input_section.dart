import 'package:web_skin_dart/ui_core.dart';
import 'package:web_skin_dart/ui_components.dart';
import 'actions.dart' show NoteActions;
import 'store.dart' show NoteStore;

@Factory()
UiFactory<InputSectionProps> InputSection;

@Props()
class InputSectionProps extends FluxUiProps<NoteActions, NoteStore> {}

//@State()
//class InputSectionState extends UiState {}

@Component()
class InputSectionComponent extends FluxUiComponent<InputSectionProps> {
  @override
  getDefaultProps() => (newProps());

  @override
  render() {
    if (props.store != null && props.store.notes.isNotEmpty) {
      return (
          (BlockContent()
            ..className = 'input-section--content'
          )(
            (AutosizeTextarea()
              ..label = 'Basic Example'
              ..hideLabel = true
              ..placeholder = 'New note...'
              ..className = 'noteArea'
            )(),
//          (TextInput()..size = InputSize.SMALL)(),
            (Nav()
              ..type = NavType.PILLS
//            ..isStacked = true
              ..style = {'maxWidth': '30rem'}
            )(
              (NavItem()
                ..isDisabled = true)('#tag1'),
              (NavItem()
                ..isDisabled = true)('#tag2'),
              (NavItem()
                ..isDisabled = true)('#tag3'),
            ),
          )
      );
    }

    return (
        (BlockContent()
          ..className = 'input-section--content'
        )(
          (Dom.h1())('Create your first note!')
        )
    );
  }
}
