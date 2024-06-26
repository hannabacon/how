// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_recips_edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyRecipsEditStore on MyRecipsEditBase, Store {
  late final _$statusPageAtom =
      Atom(name: 'MyRecipsEditBase.statusPage', context: context);

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

  late final _$updateRecipsFromControllersAsyncAction = AsyncAction(
      'MyRecipsEditBase.updateRecipsFromControllers',
      context: context);

  @override
  Future<void> updateRecipsFromControllers() {
    return _$updateRecipsFromControllersAsyncAction
        .run(() => super.updateRecipsFromControllers());
  }

  late final _$deleteRecipsAsyncAction =
      AsyncAction('MyRecipsEditBase.deleteRecips', context: context);

  @override
  Future<void> deleteRecips() {
    return _$deleteRecipsAsyncAction.run(() => super.deleteRecips());
  }

  late final _$MyRecipsEditBaseActionController =
      ActionController(name: 'MyRecipsEditBase', context: context);

  @override
  void addTextField() {
    final _$actionInfo = _$MyRecipsEditBaseActionController.startAction(
        name: 'MyRecipsEditBase.addTextField');
    try {
      return super.addTextField();
    } finally {
      _$MyRecipsEditBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTextField() {
    final _$actionInfo = _$MyRecipsEditBaseActionController.startAction(
        name: 'MyRecipsEditBase.removeTextField');
    try {
      return super.removeTextField();
    } finally {
      _$MyRecipsEditBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage}
    ''';
  }
}
