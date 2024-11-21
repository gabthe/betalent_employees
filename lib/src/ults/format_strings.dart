String formatDate(String isoDate) {
  String datePart = isoDate.split('T')[0];
  List<String> dateParts = datePart.split('-');
  return "${dateParts[2]}/${dateParts[1]}/${dateParts[0]}";
}

String formatPhone(String phone) {
  if (phone.length == 13) {
    return "+55 (${phone.substring(2, 4)}) ${phone.substring(4, 9)}-${phone.substring(9)}";
  } else {
    throw const FormatException("Número de telefone inválido");
  }
}
