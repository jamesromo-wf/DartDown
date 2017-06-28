import 'package:web_skin_dart/ui_core.dart';
import 'package:web_skin_dart/ui_components.dart';

@Factory()
UiFactory<TagsSectionProps> TagsSection;

@Props()
class TagsSectionProps extends UiProps {}

@State()
class TagsSectionState extends UiState {}

@Component()
class TagsSectionComponent extends UiStatefulComponent<TagsSectionProps, TagsSectionState> {
  @override
  render() {
    return (
      (BlockContent()
        ..className = 'tags-section--content'
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
      )
    );
  }
}
