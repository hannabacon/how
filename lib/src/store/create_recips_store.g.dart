// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recips_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateRecipsStore on CreateRecipsBase, Store {
  late final _$statusPageAtom =
      Atom(name: 'CreateRecipsBase.statusPage', context: context);

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

  late final _$createRecipsAsyncAction =
      AsyncAction('CreateRecipsBase.createRecips', context: context);

  @override
  Future<void> createRecips() {
    return _$createRecipsAsyncAction.run(() => super.createRecips());
  }

  late final _$CreateRecipsBaseActionController =
      ActionController(name: 'CreateRecipsBase', context: context);

  @override
  void addTextField() {
    final _$actionInfo = _$CreateRecipsBaseActionController.startAction(
        name: 'CreateRecipsBase.addTextField');
    try {
      return super.addTextField();
    } finally {
      _$CreateRecipsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTextField() {
    final _$actionInfo = _$CreateRecipsBaseActionController.startAction(
        name: 'CreateRecipsBase.removeTextField');
    try {
      return super.removeTextField();
    } finally {
      _$CreateRecipsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage}
    ''';
  }
}
