import 'package:desafio_be_talent/src/widgets/dotted_line.dart';
import 'package:flutter/material.dart';

class EmployeeInfosRow extends StatelessWidget {
  final String title;
  final String info;
  const EmployeeInfosRow({
    super.key,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: textStyle,
            ),
            Text(
              info,
              style: textStyle,
            ),
          ],
        ),
        const DottedLine(
          color: Colors.grey,
        ),
      ],
    );
  }
}
