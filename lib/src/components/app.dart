import 'dart:html';
import 'dart:collection';

import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

import 'package:react/react.dart' as react;
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart';
import 'package:over_react/over_react.dart';

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
        ..className = 'rootNodeDemoClasses'
      )(
        (BlockContent()
          ..className = 'content1'
          ..shrink = true
          ..gutter = BlockGutter.HORIZONTAL
        )(
          (ListGroup()
            ..className = 'TagsList'
          )(
            (ListGroupItem()
              ..className = 'StaticTags'
            )(
              (Nav()
                ..type = NavType.PILLS
                ..isStacked = true
              )(
                (NavItem()
                  ..style = {'text-align': 'center'}
                )(
                  'All'
                ),
                (NavItem()
                  ..style = {'text-align': 'center'}
                )(
                  'Trash'
                ),
              ),
            ),
            (ListGroupItem()
              ..className = 'DynamicTags'
            )(
              (Nav()
                ..type = NavType.PILLS
                ..isStacked = true
                ..style = {'maxWidth': '30rem'}
              )(
                NavItem()('#tag1'),
                NavItem()('#tag2'),
                NavItem()('#tag3'),
              ),
            ),
          ),
        ),
        (BlockContent()
          ..className = 'content2'
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
        ),
        (BlockContent()
          ..className = 'content5'
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
        ),
      ),
    );
  }
}