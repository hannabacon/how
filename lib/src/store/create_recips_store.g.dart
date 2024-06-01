// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recips_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateRecipsStore on _CreateRecipsBase, Store {
  late final _$statusPageAtom =
      Atom(name: '_CreateRecipsBase.statusPage', context: context);

  @override
  StatusPage get statusPage {
    _$statusPageAtom.reportRead();
    return super.statusPage;
  }

  @override
  set statusPage(StatusPage value) {
    _$statusPageAtom.reportWrite(value, super.statusPage, () {
      super.statusPage = value;
    });
  }

  late final _$textControllersAtom =
      Atom(name: '_CreateRecipsBase.textControllers', context: context);

  @override
  ObservableList<TextEditingController> get textControllers {
    _$textControllersAtom.reportRead();
    return super.textControllers;
  }

  @override
  set textControllers(ObservableList<TextEditingController> value) {
    _$textControllersAtom.reportWrite(value, super.textControllers, () {
      super.textControllers = value;
    });
  }

  late final _$_CreateRecipsBaseActionController =
      ActionController(name: '_CreateRecipsBase', context: context);

  @override
  void addTextField() {
    final _$actionInfo = _$_CreateRecipsBaseActionController.startAction(
        name: '_CreateRecipsBase.addTextField');
    try {
      return super.addTextField();
    } finally {
      _$_CreateRecipsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTextField() {
    final _$actionInfo = _$_CreateRecipsBaseActionController.startAction(
        name: '_CreateRecipsBase.removeTextField');
    try {
      return super.removeTextField();
    } finally {
      _$_CreateRecipsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage},
textControllers: ${textControllers}
    ''';
  }
}
