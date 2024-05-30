// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyProfileStore on MyProfileBase, Store {
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

  late final _$selectedStateAtom =
      Atom(name: 'MyProfileBase.selectedState', context: context);

  @override
  String get selectedState {
    _$selectedStateAtom.reportRead();
    return super.selectedState;
  }

  @override
  set selectedState(String value) {
    _$selectedStateAtom.reportWrite(value, super.selectedState, () {
      super.selectedState = value;
    });
  }

  late final _$selectedCityAtom =
      Atom(name: 'MyProfileBase.selectedCity', context: context);

  @override
  String get selectedCity {
    _$selectedCityAtom.reportRead();
    return super.selectedCity;
  }

  @override
  set selectedCity(String value) {
    _$selectedCityAtom.reportWrite(value, super.selectedCity, () {
      super.selectedCity = value;
    });
  }

  @override
  String toString() {
    return '''
statusPage: ${statusPage},
selectedState: ${selectedState},
selectedCity: ${selectedCity}
    ''';
  }
}
