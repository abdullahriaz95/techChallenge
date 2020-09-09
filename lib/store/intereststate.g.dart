// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intereststate.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InterestSelectionState on _InterestSelectionState, Store {
  final _$funnySelectedAtom =
      Atom(name: '_InterestSelectionState.funnySelected');

  @override
  bool get funnySelected {
    _$funnySelectedAtom.reportRead();
    return super.funnySelected;
  }

  @override
  set funnySelected(bool value) {
    _$funnySelectedAtom.reportWrite(value, super.funnySelected, () {
      super.funnySelected = value;
    });
  }

  final _$footballSelectedAtom =
      Atom(name: '_InterestSelectionState.footballSelected');

  @override
  bool get footballSelected {
    _$footballSelectedAtom.reportRead();
    return super.footballSelected;
  }

  @override
  set footballSelected(bool value) {
    _$footballSelectedAtom.reportWrite(value, super.footballSelected, () {
      super.footballSelected = value;
    });
  }

  final _$musicSelectedAtom =
      Atom(name: '_InterestSelectionState.musicSelected');

  @override
  bool get musicSelected {
    _$musicSelectedAtom.reportRead();
    return super.musicSelected;
  }

  @override
  set musicSelected(bool value) {
    _$musicSelectedAtom.reportWrite(value, super.musicSelected, () {
      super.musicSelected = value;
    });
  }

  final _$animalsSelectedAtom =
      Atom(name: '_InterestSelectionState.animalsSelected');

  @override
  bool get animalsSelected {
    _$animalsSelectedAtom.reportRead();
    return super.animalsSelected;
  }

  @override
  set animalsSelected(bool value) {
    _$animalsSelectedAtom.reportWrite(value, super.animalsSelected, () {
      super.animalsSelected = value;
    });
  }

  final _$_InterestSelectionStateActionController =
      ActionController(name: '_InterestSelectionState');

  @override
  dynamic changeFunnySelected(bool val) {
    final _$actionInfo = _$_InterestSelectionStateActionController.startAction(
        name: '_InterestSelectionState.changeFunnySelected');
    try {
      return super.changeFunnySelected(val);
    } finally {
      _$_InterestSelectionStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeAnimalsSelected(bool val) {
    final _$actionInfo = _$_InterestSelectionStateActionController.startAction(
        name: '_InterestSelectionState.changeAnimalsSelected');
    try {
      return super.changeAnimalsSelected(val);
    } finally {
      _$_InterestSelectionStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFootballSelected(bool val) {
    final _$actionInfo = _$_InterestSelectionStateActionController.startAction(
        name: '_InterestSelectionState.changeFootballSelected');
    try {
      return super.changeFootballSelected(val);
    } finally {
      _$_InterestSelectionStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMusicSelected(bool val) {
    final _$actionInfo = _$_InterestSelectionStateActionController.startAction(
        name: '_InterestSelectionState.changeMusicSelected');
    try {
      return super.changeMusicSelected(val);
    } finally {
      _$_InterestSelectionStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeOboardingPref() {
    final _$actionInfo = _$_InterestSelectionStateActionController.startAction(
        name: '_InterestSelectionState.changeOboardingPref');
    try {
      return super.changeOboardingPref();
    } finally {
      _$_InterestSelectionStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
funnySelected: ${funnySelected},
footballSelected: ${footballSelected},
musicSelected: ${musicSelected},
animalsSelected: ${animalsSelected}
    ''';
  }
}
