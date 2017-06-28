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

//const divStyle = {
//  color: 'blue',
//  backgroundImage: 'url(' + imgUrl + ')',
//};

@Component()
class AppComponent extends UiStatefulComponent<AppProps, AppState>{

  @override
  render(){
    return GridFrame()(
        (Block()
          ..className = 'rootNodeDemoClasses'
        )(
            (Block()
              ..className = 'content1'
              ..shrink = true
              ..gutter = BlockGutter.HORIZONTAL
//              ..collapse = BlockCollapse.HORIZONTAL
            )(
              (ListGroup()
                ..showItemDividers = false
              )(
                ListGroupItem()('Test1'),
                ListGroupItem()('Test2'),
                ListGroupItem()('Test1'),
                ListGroupItem()('Test2'),
                ListGroupItem()('Test1'),
                ListGroupItem()('Test2'),
                ListGroupItem()('Test1'),
                ListGroupItem()('Test2'),
              )
            ),
            (BlockContent()
              ..className = 'content2'
              ..shrink = true
//              ..collapse = BlockCollapse.HORIZONTAL
            )(
              (VBlock()
                ..shrink = true
                ..isNested = false
              )(
                (TextInput()..size = InputSize.LARGE)(),
                // Not currently working
                (FilterableDropdownMenuPrimitive()
                  ..defaultSearchQuery = 'Alien'
                  ..searchFilter = (dynamic item, String searchQuery) {
                    // For this implementation, we know all the items are going to be SelectOptions...
                    var selectOptionProps = SelectOption()
                      ..addAll(new SelectOptionComponent().getDefaultProps())
                      ..addAll(getProps(item));

                    return selectOptionProps.displayText.toUpperCase().contains(searchQuery.toUpperCase());
                  }
                )(
                  (SelectOption()
                    ..displayText = 'The Adventures of Buckaroo Banzai Across the 8th Dimension'
                    ..value = 1
                  )('The Adventures of Buckaroo Banzai Across the 8th Dimension'),
                  (SelectOption()
                    ..displayText = 'Alien'
                    ..value = 2
                  )('Alien'),
                  (SelectOption()
                    ..displayText = 'Alien Nation'
                    ..value = 3
                  )('Alien Nation'),
                  (SelectOption()
                    ..displayText = 'Aliens'
                    ..value = 4
                  )('Aliens'),
                  (SelectOption()
                    ..displayText = 'Buck Rogers in the 25th Century'
                    ..value = 5
                  )('Buck Rogers in the 25th Century'),
                  (SelectOption()
                    ..displayText = 'Enemy Mine'
                    ..value = 6
                  )('Enemy Mine'),
                  (SelectOption()
                    ..displayText = 'Event Horizon'
                    ..value = 7
                  )('Event Horizon'),
                  (SelectOption()
                    ..displayText = 'Flash Gordon'
                    ..value = 8
                  )('Flash Gordon'),
                  (SelectOption()
                    ..displayText = 'Galaxy Quest'
                    ..value = 9
                  )('Galaxy Quest'),
                  (SelectOption()
                    ..displayText = 'Spaceballs'
                    ..value = 10
                  )('Spaceballs'),
                  (SelectOption()
                    ..displayText = 'Star Wars'
                    ..value = 11
                  )('Star Wars'),
                  (SelectOption()
                    ..displayText = 'Star Trek'
                    ..value = 12
                  )('Star Trek')
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
            ),
            (BlockContent()
              ..className = 'content5'
            )(
              (AutosizeTextarea()
                ..label = 'Basic Example'
                ..hideLabel = true
                ..placeholder = 'New note...'
                ..className = 'noteArea'
              )()
            ),
        ),
    );
  }
}