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

@Factory()
UiFactory<AppProps> App;

@Props()
class AppProps extends UiProps {}

@State()
class AppState extends UiState {}

@Component()
class AppComponent extends UiStatefulComponent<AppProps, AppState>{

  @override
  render(){
    return GridFrame()(
      (Block()
        ..className = 'grid-root-content'
      )(
        (TagsSection()..className = 'tags-section')(),
        (NotesSection()..className = 'notes-section')(),
        (InputSection()..className = 'input-section')(),
      ),
    );
  }
}