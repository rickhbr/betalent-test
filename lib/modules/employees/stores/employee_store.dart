import 'package:mobx/mobx.dart';
import '../../../core/services/api_service.dart';
import '../models/employee_model.dart';

part 'employee_store.g.dart';

class EmployeeStore = EmployeeStoreBase with _$EmployeeStore;

abstract class EmployeeStoreBase with Store {
  final ApiService _apiService = ApiService();

  @observable
  ObservableList<EmployeeModel> employees = ObservableList<EmployeeModel>();

  @observable
  String searchQuery = "";

  @observable
  int? expandedIndex;

  @computed
  List<EmployeeModel> get filteredEmployees {
    final normalizedQuery = searchQuery.toLowerCase().replaceAll(RegExp(r'[^\d\w\s]'), '');

    return employees.where((employee) {
      final normalizedName = employee.name.toLowerCase();
      final normalizedJob = employee.job.toLowerCase();
      final normalizedPhone = employee.phone.replaceAll(RegExp(r'[^\d]'), '');

      return normalizedName.contains(searchQuery.toLowerCase()) ||
          normalizedJob.contains(searchQuery.toLowerCase()) ||
          normalizedPhone.contains(normalizedQuery);
    }).toList();
  }

  @action
  Future<void> loadEmployees() async {
    try {
      final data = await _apiService.fetchEmployees();
      employees.addAll(data);
    } catch (e) {
      throw Exception("Failed to load employees: $e");
    }
  }

  @action
  void setSearchQuery(String query) {
    searchQuery = query;
    expandedIndex = null;
  }

  @action
  void setExpandedIndex(int? index) {
    expandedIndex = index;
  }
}
