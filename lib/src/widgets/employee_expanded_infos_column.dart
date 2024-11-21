import 'package:desafio_be_talent/src/model/employee_model.dart';
import 'package:desafio_be_talent/src/ults/format_strings.dart';
import 'package:desafio_be_talent/src/widgets/employee_infos_row.dart';
import 'package:flutter/material.dart';

class EmployeeExpandedInfosColumn extends StatelessWidget {
  const EmployeeExpandedInfosColumn({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 31,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EmployeeInfosRow(
            info: employee.job,
            title: "Cargo",
          ),
          EmployeeInfosRow(
            info: formatDate(employee.admissionDate),
            title: "Data de adimissao",
          ),
          EmployeeInfosRow(
            info: formatPhone(employee.phone),
            title: "Telefone",
          ),
        ],
      ),
    );
  }
}
