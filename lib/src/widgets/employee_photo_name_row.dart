import 'package:desafio_be_talent/src/model/employee_model.dart';
import 'package:desafio_be_talent/src/ults/colors.dart';
import 'package:flutter/cupertino.dart';

class EmployeePhotoNameRow extends StatelessWidget {
  final bool isExpanded;
  const EmployeePhotoNameRow({
    super.key,
    required this.employee,
    required this.isExpanded,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 34,
              width: 34,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.network(employee.image),
              ),
            ),
            const SizedBox(width: 24),
            Text(
              employee.name,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: isExpanded ? 0.5 : 0.0,
              child: Icon(
                CupertinoIcons.chevron_down,
                size: 32,
                color: colors[ColorPalette.primaryBlue],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
