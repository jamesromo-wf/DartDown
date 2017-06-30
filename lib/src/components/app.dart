import 'dart:html';
import 'dart:collection';

import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

import 'package:react/react.dart' as react;
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart';
import 'package:over_react/over_react.dart';
import 'tags_section.dart';
import 'notes_section.dart';
import 'input_section.dart';
import 'store.dart';
import 'actions.dart';

@Factory()
UiFactory<AppProps> App;

@Props()
class AppProps extends FluxUiProps<DartDownActions, DartDownStore> {}

@Component()
class AppComponent extends FluxUiComponent<AppProps> {
  @override
  getDefaultProps() => (newProps());

  @override
  render(){
    return GridFrame()(
      (Block()
        ..className = 'grid-root-content'
      )(
        (TagsSection()
          ..className = 'tags-section'
          ..tags = props.store.tags
          ..activeTags = props.store.activeTags
          ..actions = props.actions
        )(),
        (NotesSection()
          ..className = 'notes-section'
          ..notes = props.store.notes
          ..actions = props.actions
          ..activeNote = props.store.activeNote
        )(),
        (InputSection()
          ..className = 'input-section'
          ..activeNote = props.store.activeNote
          ..actions = props.actions
        )(),
      ),
    );
  }
}