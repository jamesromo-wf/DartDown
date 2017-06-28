import 'package:web_skin_dart/ui_core.dart';
import 'package:web_skin_dart/ui_components.dart';

@Factory()
UiFactory<InputSectionProps> InputSection;

@Props()
class InputSectionProps extends UiProps {}

@State()
class InputSectionState extends UiState {}

@Component()
class InputSectionComponent extends UiStatefulComponent<InputSectionProps, InputSectionState> {
  @override
  render() {
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
            (NavItem()..isDisabled = true)('#tag1'),
            (NavItem()..isDisabled = true)('#tag2'),
            (NavItem()..isDisabled = true)('#tag3'),
          ),
        )
    );
  }
}
