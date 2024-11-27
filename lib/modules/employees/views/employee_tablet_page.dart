import 'package:betalent_test/core/constants/colors.dart';
import 'package:betalent_test/core/constants/spacing.dart';
import 'package:betalent_test/core/constants/typography.dart';
import 'package:betalent_test/core/widgets/app_bar/custom_app_bar.dart';
import 'package:betalent_test/modules/employees/widgets/employee_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/employee_store.dart';

class EmployeeTablePage extends StatelessWidget {
  final EmployeeStore store = EmployeeStore();

  EmployeeTablePage({super.key}) {
    store.loadEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Employee Table",
        avatarText: "CG",
        notificationCount: 2,
        onNotificationPressed: () {},
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: AppSpacing.regular20, right: AppSpacing.regular20, top: AppSpacing.regular20),
              child: Text('Funcionários', style: AppTypography.h1),
            ),
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.only(
                    left: AppSpacing.regular20,
                    right: AppSpacing.regular20,
                    top: AppSpacing.regular16,
                    bottom: AppSpacing.regular20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Pesquisar",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: AppColors.grey5,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: store.setSearchQuery,
                ),
              ),
            ),
            Observer(
              builder: (_) {
                if (store.employees.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.regular20),
                  child: EmployeeTable(
                    employees: store.filteredEmployees,
                    expandedIndex: store.expandedIndex,
                    onExpansionChanged: store.setExpandedIndex,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
