import 'package:dio/dio.dart';
import '../../modules/employees/models/employee_model.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = "http://192.168.1.35:3000";
  }

  Future<List<EmployeeModel>> fetchEmployees() async {
    try {
      final response = await _dio.get('/employees');
      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => EmployeeModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to fetch employees: $e");
    }
  }
}
