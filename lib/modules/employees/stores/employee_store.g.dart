// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeStore on EmployeeStoreBase, Store {
  Computed<List<EmployeeModel>>? _$filteredEmployeesComputed;

  @override
  List<EmployeeModel> get filteredEmployees => (_$filteredEmployeesComputed ??=
          Computed<List<EmployeeModel>>(() => super.filteredEmployees, name: 'EmployeeStoreBase.filteredEmployees'))
      .value;

  late final _$employeesAtom = Atom(name: 'EmployeeStoreBase.employees', context: context);

  @override
  ObservableList<EmployeeModel> get employees {
    _$employeesAtom.reportRead();
    return super.employees;
  }

  @override
  set employees(ObservableList<EmployeeModel> value) {
    _$employeesAtom.reportWrite(value, super.employees, () {
      super.employees = value;
    });
  }

  late final _$searchQueryAtom = Atom(name: 'EmployeeStoreBase.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$expandedIndexAtom = Atom(name: 'EmployeeStoreBase.expandedIndex', context: context);

  @override
  int? get expandedIndex {
    _$expandedIndexAtom.reportRead();
    return super.expandedIndex;
  }

  @override
  set expandedIndex(int? value) {
    _$expandedIndexAtom.reportWrite(value, super.expandedIndex, () {
      super.expandedIndex = value;
    });
  }

  late final _$loadEmployeesAsyncAction = AsyncAction('EmployeeStoreBase.loadEmployees', context: context);

  @override
  Future<void> loadEmployees() {
    return _$loadEmployeesAsyncAction.run(() => super.loadEmployees());
  }

  late final _$EmployeeStoreBaseActionController = ActionController(name: 'EmployeeStoreBase', context: context);

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$EmployeeStoreBaseActionController.startAction(name: 'EmployeeStoreBase.setSearchQuery');
    try {
      return super.setSearchQuery(query);
    } finally {
      _$EmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpandedIndex(int? index) {
    final _$actionInfo = _$EmployeeStoreBaseActionController.startAction(name: 'EmployeeStoreBase.setExpandedIndex');
    try {
      return super.setExpandedIndex(index);
    } finally {
      _$EmployeeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
employees: ${employees},
searchQuery: ${searchQuery},
expandedIndex: ${expandedIndex},
filteredEmployees: ${filteredEmployees}
    ''';
  }
}
