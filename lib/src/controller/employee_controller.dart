import 'package:flutter/material.dart';

import 'package:desafio_be_talent/src/model/employee_model.dart';
import 'package:desafio_be_talent/src/repository/employee_repo.dart';

class EmployeeController extends ChangeNotifier {
  EmployeeRepo employeeRepo = EmployeeRepo();
  ValueNotifier<EmployeeViewState> employeeViewState =
      ValueNotifier<EmployeeViewState>(
    EmployeeViewState.empty(),
  );

  EmployeeController() {
    _init();
  }

  _init() async {
    await fetchEmployees();
  }

  fetchEmployees() async {
    try {
      setErrorMessage("");
      setLoading(true);
      List<Employee> employees = await employeeRepo.fetchEmployees();
      setLoading(false);

      for (int i = 0; i < employees.length; i++) {
        employeeViewState.value.employees.add(employees[i]);
        employeeViewState.value.filteredEmployees.add(employees[i]);
        employeeViewState.value.listKey.currentState?.insertItem(i);
        await Future.delayed(const Duration(milliseconds: 100));
      }
    } catch (e) {
      setErrorMessage("Erro ao buscar funcionários");
      setLoading(false);
    }
  }

  setErrorMessage(String message) {
    employeeViewState.value = employeeViewState.value.copyWith(
      errorMessage: message,
    );
  }

  setLoading(bool load) {
    employeeViewState.value = employeeViewState.value.copyWith(
      loading: load,
    );
  }

  setSearchText(String text) {
    var textLowerCase = text.toLowerCase();
    employeeViewState.value = employeeViewState.value.copyWith(
        searchString: text,
        filteredEmployees: employeeViewState.value.employees.where(
          (element) {
            return element.name.toLowerCase().contains(textLowerCase) ||
                element.job.toLowerCase().contains(textLowerCase) ||
                element.phone.toLowerCase().contains(textLowerCase);
          },
        ).toList());
  }

  setExpandedCardId(String id) {
    if (!employeeViewState.value.expandedCardIds.contains(id)) {
      employeeViewState.value = employeeViewState.value.copyWith(
        expandedCardIds: [...employeeViewState.value.expandedCardIds, id],
      );
    } else {
      employeeViewState.value = employeeViewState.value.copyWith(
        expandedCardIds: employeeViewState.value.expandedCardIds
            .where((element) => element != id)
            .toList(),
      );
    }
  }
}

class EmployeeViewState {
  final bool loading;
  final List<Employee> employees;
  final List<Employee> filteredEmployees;
  final String errorMessage;
  final List<String> expandedCardIds;
  final GlobalKey<AnimatedListState> listKey;
  final String searchString;

  EmployeeViewState({
    required this.loading,
    required this.employees,
    required this.filteredEmployees,
    required this.errorMessage,
    required this.expandedCardIds,
    required this.listKey,
    required this.searchString,
  });

  factory EmployeeViewState.empty() {
    return EmployeeViewState(
      loading: false,
      employees: [],
      filteredEmployees: [],
      expandedCardIds: [],
      errorMessage: '',
      searchString: '',
      listKey: GlobalKey<AnimatedListState>(),
    );
  }

  EmployeeViewState copyWith({
    bool? loading,
    List<Employee>? employees,
    List<Employee>? filteredEmployees,
    String? errorMessage,
    List<String>? expandedCardIds,
    GlobalKey<AnimatedListState>? listKey,
    String? searchString,
  }) {
    return EmployeeViewState(
      loading: loading ?? this.loading,
      employees: employees ?? this.employees,
      filteredEmployees: filteredEmployees ?? this.filteredEmployees,
      errorMessage: errorMessage ?? this.errorMessage,
      expandedCardIds: expandedCardIds ?? this.expandedCardIds,
      listKey: listKey ?? this.listKey,
      searchString: searchString ?? this.searchString,
    );
  }
}
