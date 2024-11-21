import 'package:desafio_be_talent/src/controller/employee_controller.dart';
import 'package:desafio_be_talent/src/model/employee_model.dart';
import 'package:desafio_be_talent/src/ults/colors.dart';
import 'package:desafio_be_talent/src/widgets/employee_card.dart';
import 'package:desafio_be_talent/src/widgets/employee_view_bar.dart';
import 'package:flutter/material.dart';

class EmployeesView extends StatelessWidget {
  const EmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeController = EmployeeController();

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: employeeController.employeeViewState,
          builder: (context, state, child) {
            const textStyle = TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            );
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EmployeeViewBar(),
                  const Text(
                    "Funcionários",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    enabled: state.employees.isEmpty ? false : true,
                    onChanged: (value) =>
                        employeeController.setSearchText(value),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: "Pesquisar",
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 47,
                    decoration: BoxDecoration(
                      color: colors[ColorPalette.blue10],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            "Foto",
                            style: textStyle,
                          ),
                          SizedBox(width: 24),
                          Text(
                            "Nome",
                            style: textStyle,
                          ),
                          Spacer(),
                          Icon(
                            Icons.circle,
                            size: 15,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                  if (state.searchString != "")
                    Expanded(
                      child: ListView.builder(
                        key: state.listKey,
                        itemCount: state.filteredEmployees.length,
                        itemBuilder: (context, index) {
                          Employee? employee = state.filteredEmployees[index];
                          bool isLastItem =
                              index == state.filteredEmployees.length - 1;
                          bool isExpanded =
                              state.expandedCardIds.contains(employee.id);
                          return InkWell(
                            onTap: () {
                              employeeController.setExpandedCardId(employee.id);
                            },
                            child: EmployeeCard(
                              isExpanded: isExpanded,
                              isLastItem: isLastItem,
                              employee: employee,
                            ),
                          );
                        },
                      ),
                    ),
                  if (state.employees.isNotEmpty && state.searchString == "")
                    Expanded(
                      child: AnimatedList(
                        key: state.listKey,
                        initialItemCount: state.employees.length,
                        itemBuilder: (context, index, animation) {
                          Employee employee = state.employees[index];
                          bool isLastItem = index == state.employees.length - 1;
                          bool isExpanded =
                              state.expandedCardIds.contains(employee.id);
                          return SizeTransition(
                            sizeFactor: animation,
                            child: InkWell(
                              onTap: () {
                                employeeController
                                    .setExpandedCardId(employee.id);
                              },
                              child: EmployeeCard(
                                isExpanded: isExpanded,
                                isLastItem: isLastItem,
                                employee: employee,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  if (state.loading)
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: const SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                          ),
                        ),
                      ),
                    ),
                  if (state.errorMessage.isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 25,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Erro ao buscar dados",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (state.employees.isEmpty && !state.loading)
                    Center(
                      child: TextButton(
                        onPressed: () {
                          employeeController.fetchEmployees();
                        },
                        child: const Text("Buscar funcionários"),
                      ),
                    ),
                  const SizedBox(height: 12),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
