// Copyright (c) 2017, jamesromo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:core';
import 'package:react/react.dart' as react;
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' show setClientConfiguration;
import 'package:over_react/over_react.dart';
import 'package:DartDown/src/components/app.dart';
import 'package:web_skin_dart/ui_components.dart';
import 'package:DartDown/src/components/store.dart';
import 'package:DartDown/src/components/actions.dart';

void main() {
  decorateRootNodeWithPlatformClasses(features: getWebSkinFeatures());

  //Initialize React within our Dart App:
  setClientConfiguration();

  var _actions = new DartDownActions();
  var _store = new DartDownStore(_actions);

  react_dom.render(
      (App()
        ..className = "DartDown"
        ..actions = _actions
        ..store = _store
      )(),
      querySelector('#container'));
}
