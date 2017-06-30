import 'package:web_skin_dart/ui_core.dart';
import 'package:web_skin_dart/ui_components.dart';
import 'models/note.dart';
import 'models/tag.dart';
import 'actions.dart';

@Factory()
UiFactory<TagsSectionProps> TagsSection;

@Props()
class TagsSectionProps extends UiProps {
  List<Tag> tags;
  DartDownActions actions;
  Set<Tag> activeTags;
}

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
              renderTags()
//              NavItem()('#tag1'),
//              NavItem()('#tag2'),
//              NavItem()('#tag3'),
            ),
          ),
        ),
      )
    );
  }

  List renderTags() {
    if (props != null && props.tags != null) {
      List tagList = [];

      for (Tag tagItem in props.tags) {
        var navItem = (NavItem()
          ..key = tagItem.title
          ..targetKey = tagItem.title
          ..onSelect = _selectTag
          ..skin = props.activeTags.contains(tagItem)
              ? NavItemPillSkin.ALT
              : NavItemPillSkin.DEFAULT)(tagItem.title);
        tagList.add(navItem);
      }

      return tagList;
    }
  }

  _selectTag(SyntheticEvent e, Object o) {
    String tagTitle = o;
    Tag tag = new Tag(tagTitle);
    props.actions.toggleTag(tag);
  }
}
