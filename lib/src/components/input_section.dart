import 'package:web_skin_dart/ui_core.dart';
import 'package:web_skin_dart/ui_components.dart';
import 'actions.dart';
import 'store.dart';
import 'models/note.dart';
import 'actions.dart';
import 'dart:async';

@Factory()
UiFactory<InputSectionProps> InputSection;

@Props()
class InputSectionProps extends UiProps {
  Note activeNote;
  DartDownActions actions;
}

@State()
class InputSectionState extends UiState {
  String noteText;
}

@Component()
class InputSectionComponent extends UiStatefulComponent<InputSectionProps, InputSectionState> {
  static const TIMEOUT = const Duration(seconds: 2);
  static const ms = const Duration(milliseconds: 1);
  Timer saveNoteTimer;

  @override
  Map getInitialState() {
    if (props.activeNote != null) {
      print('active note');
      return (newState()..noteText = props.activeNote.text);
    } else {
      print('no active note');
      return (newState()..noteText = null);
    }
  }

  @override
  void componentWillReceiveProps(Map nextProps) {
    super.componentWillReceiveProps(nextProps);

    print('received props');

    if (nextProps.containsKey('InputSectionProps.activeNote')) {
      print('received props2');

      Note nextNote = nextProps['InputSectionProps.activeNote'];

      if (props.activeNote != null && (nextNote != props.activeNote
          || (nextNote == props.activeNote && props.activeNote.text != state.noteText))) {
        _saveNoteText(null);
        print('received props3');
      }
      print('received props4');
      setState(newState()..noteText = nextNote != null ? nextNote.text : null);
    }
  }

//  @override
//  getDefaultProps() => (newProps());

  @override
  render() {
    if (state != null && state.noteText != null) {
      print('note text not null');
      return (
          (BlockContent()
            ..className = 'input-section--content'
          )(
            (AutosizeTextarea()
              ..label = 'Basic Example'
              ..hideLabel = true
              ..placeholder = 'New note...'
              ..className = 'noteArea'
              ..value = state.noteText != null ? state.noteText : ''
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

    print('note text null');
    return (
        (BlockContent()
          ..className = 'input-section--content'
        )(
          (Dom.h1())('Create your first note!')
        )
    );
  }

  void _updateNoteText(SyntheticFormEvent event) {
    var noteText = event.target.value;
    setState(newState()..noteText = noteText);

    if (saveNoteTimer != null && saveNoteTimer.isActive) {
      saveNoteTimer.cancel();
    }
    saveNoteTimer = startTimeout();
  }

  void _saveNoteText(_) {
    var modifiedNote = props.activeNote.change(text: state.noteText);
    modifiedNote.updateNoteHashtags();
    props.actions.editNote(modifiedNote);
  }

  void _focusGainedHandler(SyntheticFocusEvent event) {
    // Do whatever we want when focusing on the text area. Dim/fade the other columns?
  }

  void _focusLostHandler(SyntheticFocusEvent event) {
    _saveNoteText(null);
  }

  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? TIMEOUT : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    // callback function
    _saveNoteText(null);
    print('Autosaving Note');
  }
}
