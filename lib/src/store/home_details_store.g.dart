// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeDetailsStore on HomeDetailsBase, Store {
  late final _$statusPageAtom =
      Atom(name: 'HomeDetailsBase.statusPage', context: context);

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

  late final _$getDataAsyncAction =
      AsyncAction('HomeDetailsBase.getData', context: context);

  @override
  Future<void> getData(String idRecips) {
    return _$getDataAsyncAction.run(() => super.getData(idRecips));
  }

  late final _$updateRecipsFromControllersAsyncAction = AsyncAction(
      'HomeDetailsBase.updateRecipsFromControllers',
      context: context);

  @override
  Future<void> updateRecipsFromControllers() {
    return _$updateRecipsFromControllersAsyncAction
        .run(() => super.updateRecipsFromControllers());
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage}
    ''';
  }
}
