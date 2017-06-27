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
    return (Dom.div())(
        Dom.h1()("Dart Down"),
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
            )('Preview'),
        ),
    );
  }
}