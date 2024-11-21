import 'dart:convert';

import 'package:desafio_be_talent/src/model/employee_model.dart';
import 'package:desafio_be_talent/src/ults/url.dart';
import 'package:http/http.dart' as http;

class EmployeeRepo {
  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(
        Uri.parse(urls[LocalUrls.android]),
        // Uri.parse(urls[LocalUrls.ios]),
        // Substitua por IOS caso esteja testando em um emulador de iphone
      );
      if (response.statusCode == 200) {
        List<dynamic> responseDecoded = json.decode(response.body);
        return responseDecoded
            .map(
              (e) => Employee.fromMap(e),
            )
            .toList();
      } else {
        throw Exception('Falha ao carregar os dados');
      }
    } catch (e) {
      rethrow;
    }
  }
}
