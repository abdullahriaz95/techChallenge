// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homestate.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on _HomeState, Store {
  final _$categoryAtom = Atom(name: '_HomeState.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$videoManagerAtom = Atom(name: '_HomeState.videoManager');

  @override
  VideoManager get videoManager {
    _$videoManagerAtom.reportRead();
    return super.videoManager;
  }

  @override
  set videoManager(VideoManager value) {
    _$videoManagerAtom.reportWrite(value, super.videoManager, () {
      super.videoManager = value;
    });
  }

  final _$observableListAtom = Atom(name: '_HomeState.observableList');

  @override
  ObservableList<VideoData> get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<VideoData> value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  final _$indexAtom = Atom(name: '_HomeState.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$changeVideoAsyncAction = AsyncAction('_HomeState.changeVideo');

  @override
  Future changeVideo(int index) {
    return _$changeVideoAsyncAction.run(() => super.changeVideo(index));
  }

  final _$_HomeStateActionController = ActionController(name: '_HomeState');

  @override
  void changeCategory(String newCategory) {
    final _$actionInfo = _$_HomeStateActionController.startAction(
        name: '_HomeState.changeCategory');
    try {
      return super.changeCategory(newCategory);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
videoManager: ${videoManager},
observableList: ${observableList},
index: ${index}
    ''';
  }
}
