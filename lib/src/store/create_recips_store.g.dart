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

  late final _$imageFileAtom =
      Atom(name: 'CreateRecipsBase.imageFile', context: context);

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$imageUrlAtom =
      Atom(name: 'CreateRecipsBase.imageUrl', context: context);

  @override
  String? get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String? value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$pickImageAsyncAction =
      AsyncAction('CreateRecipsBase.pickImage', context: context);

  @override
  Future<void> pickImage(ImageSource source) {
    return _$pickImageAsyncAction.run(() => super.pickImage(source));
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
  void removeImage() {
    final _$actionInfo = _$CreateRecipsBaseActionController.startAction(
        name: 'CreateRecipsBase.removeImage');
    try {
      return super.removeImage();
    } finally {
      _$CreateRecipsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage},
imageFile: ${imageFile},
imageUrl: ${imageUrl}
    ''';
  }
}
