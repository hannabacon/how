// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateUserStore on CreateUserBase, Store {
  late final _$imageFileAtom =
      Atom(name: 'CreateUserBase.imageFile', context: context);

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
      Atom(name: 'CreateUserBase.imageUrl', context: context);

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

  late final _$statusPageAtom =
      Atom(name: 'CreateUserBase.statusPage', context: context);

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

  late final _$pickImageAsyncAction =
      AsyncAction('CreateUserBase.pickImage', context: context);

  @override
  Future<void> pickImage(ImageSource source) {
    return _$pickImageAsyncAction.run(() => super.pickImage(source));
  }

  late final _$createUserAsyncAction =
      AsyncAction('CreateUserBase.createUser', context: context);

  @override
  Future<void> createUser(BuildContext context) {
    return _$createUserAsyncAction.run(() => super.createUser(context));
  }

  late final _$CreateUserBaseActionController =
      ActionController(name: 'CreateUserBase', context: context);

  @override
  void setStatusPage(StatusPage value) {
    final _$actionInfo = _$CreateUserBaseActionController.startAction(
        name: 'CreateUserBase.setStatusPage');
    try {
      return super.setStatusPage(value);
    } finally {
      _$CreateUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeImage() {
    final _$actionInfo = _$CreateUserBaseActionController.startAction(
        name: 'CreateUserBase.removeImage');
    try {
      return super.removeImage();
    } finally {
      _$CreateUserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageFile: ${imageFile},
imageUrl: ${imageUrl},
statusPage: ${statusPage}
    ''';
  }
}
