import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:desafio_be_talent/src/controller/employee_controller.dart';
import 'package:desafio_be_talent/src/model/employee_model.dart';
import 'package:mockito/annotations.dart';
import 'package:desafio_be_talent/src/repository/employee_repo.dart';
import 'employee_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<EmployeeRepo>()])
void main() {
  late EmployeeController controller;
  late MockEmployeeRepo mockRepo;

  setUp(() {
    mockRepo = MockEmployeeRepo();
    controller = EmployeeController();
    controller.employeeRepo = mockRepo;
  });

  group('fetchEmployees', () {
    test('Deve buscar funcionários e adicioná-los à lista com sucesso',
        () async {
      when(mockRepo.fetchEmployees()).thenAnswer(
        (_) async => [
          Employee(
            id: '1',
            name: 'John Doe',
            job: 'Developer',
            image: '',
            phone: '123456789',
            admissionDate: '2023-01-01',
          ),
        ],
      );

      await controller.fetchEmployees();

      expect(controller.employeeViewState.value.employees.length, 1);
      expect(controller.employeeViewState.value.employees[0].name, 'John Doe');
      expect(controller.employeeViewState.value.loading, false);

      verify(mockRepo.fetchEmployees()).called(1);
    });

    test('Deve definir uma mensagem de erro ao falhar na busca de funcionários',
        () async {
      when(mockRepo.fetchEmployees())
          .thenThrow(Exception('Erro ao buscar funcionários'));

      await controller.fetchEmployees();

      expect(controller.employeeViewState.value.errorMessage,
          'Erro ao buscar funcionários');
      expect(controller.employeeViewState.value.loading, false);
    });
  });

  group('setSearchText', () {
    test('Deve filtrar funcionários pelo texto de busca', () {
      controller.employeeViewState.value =
          controller.employeeViewState.value.copyWith(
        employees: [
          Employee(
            id: '1',
            name: 'Alice',
            job: 'Designer',
            image: '',
            phone: '',
            admissionDate: '2023-01-01',
          ),
          Employee(
            id: '2',
            name: 'Bob',
            job: 'Developer',
            image: '',
            phone: '',
            admissionDate: '2023-01-01',
          ),
        ],
      );

      controller.setSearchText('Alice');

      expect(controller.employeeViewState.value.filteredEmployees.length, 1);
      expect(controller.employeeViewState.value.filteredEmployees[0].name,
          'Alice');
    });
  });

  group('setExpandedCardId', () {
    test('Deve expandir um card ao adicionar o ID à lista', () {
      controller.setExpandedCardId('1');

      expect(controller.employeeViewState.value.expandedCardIds.contains('1'),
          true);
    });

    test('Deve colapsar um card ao remover o ID da lista', () {
      controller.setExpandedCardId('1');
      controller.setExpandedCardId('1');

      expect(controller.employeeViewState.value.expandedCardIds.contains('1'),
          false);
    });
  });

  group('setLoading', () {
    test('Deve alternar o estado de carregamento', () {
      controller.setLoading(true);

      expect(controller.employeeViewState.value.loading, true);

      controller.setLoading(false);
      expect(controller.employeeViewState.value.loading, false);
    });
  });
}
