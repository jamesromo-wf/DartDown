import 'dart:math';
import 'package:web_skin_dart/ui_core.dart';
import 'package:web_skin_dart/ui_components.dart';

class Tag {
  String _title;

  Tag(String title) {
    this._title = title;
  }

//  operator ==(Tag t) => this._title == t.title;

  String get title => this._title;

  @override
  String toString() {
    return _title;
  }

  @override
  int get hashCode => _title.hashCode;
}
