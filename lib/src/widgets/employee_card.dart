import 'package:desafio_be_talent/src/model/employee_model.dart';
import 'package:desafio_be_talent/src/ults/colors.dart';
import 'package:desafio_be_talent/src/widgets/employee_expanded_infos_column.dart';
import 'package:desafio_be_talent/src/widgets/employee_photo_name_row.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    required this.isExpanded,
    required this.isLastItem,
    required this.employee,
  });

  final bool isExpanded;
  final bool isLastItem;
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isExpanded ? 200 : 62,
      decoration: BoxDecoration(
        borderRadius: isLastItem
            ? const BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )
            : BorderRadius.circular(
                0,
              ),
        border: Border(
          top: BorderSide(
            color: colors[ColorPalette.gray10]!,
          ),
          left: BorderSide(
            color: colors[ColorPalette.gray10]!,
          ),
          right: BorderSide(
            color: colors[ColorPalette.gray10]!,
          ),
          bottom: BorderSide(
            color: colors[ColorPalette.gray10]!,
            width: isLastItem ? 1 : 0.1,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: EmployeePhotoNameRow(
              employee: employee,
              isExpanded: isExpanded,
            ),
          ),
          if (isExpanded)
            Expanded(
              child: EmployeeExpandedInfosColumn(employee: employee),
            ),
        ],
      ),
    );
  }
}
