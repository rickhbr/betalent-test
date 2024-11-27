String formatDate(String date) {
  final parsedDate = DateTime.parse(date);
  return "${parsedDate.day.toString().padLeft(2, '0')}/${parsedDate.month.toString().padLeft(2, '0')}/${parsedDate.year}";
}

String formatPhone(String phone) {
  return "+${phone.substring(0, 2)} (${phone.substring(2, 4)}) ${phone.substring(4, 8)}-${phone.substring(8)}";
}
