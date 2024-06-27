// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyProfileStore on MyProfileBase, Store {
  late final _$userAtom = Atom(name: 'MyProfileBase.user', context: context);

  @override
  Map<String, dynamic> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Map<String, dynamic> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$statusPageAtom =
      Atom(name: 'MyProfileBase.statusPage', context: context);

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
      Atom(name: 'MyProfileBase.imageFile', context: context);

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
      Atom(name: 'MyProfileBase.imageUrl', context: context);

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
      AsyncAction('MyProfileBase.pickImage', context: context);

  @override
  Future<void> pickImage(ImageSource source) {
    return _$pickImageAsyncAction.run(() => super.pickImage(source));
  }

  late final _$getDataAsyncAction =
      AsyncAction('MyProfileBase.getData', context: context);

  @override
  Future<void> getData(String idUser) {
    return _$getDataAsyncAction.run(() => super.getData(idUser));
  }

  late final _$updateUserAsyncAction =
      AsyncAction('MyProfileBase.updateUser', context: context);

  @override
  Future<void> updateUser() {
    return _$updateUserAsyncAction.run(() => super.updateUser());
  }

  late final _$MyProfileBaseActionController =
      ActionController(name: 'MyProfileBase', context: context);

  @override
  void removeImage() {
    final _$actionInfo = _$MyProfileBaseActionController.startAction(
        name: 'MyProfileBase.removeImage');
    try {
      return super.removeImage();
    } finally {
      _$MyProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
statusPage: ${statusPage},
imageFile: ${imageFile},
imageUrl: ${imageUrl}
    ''';
  }
}
