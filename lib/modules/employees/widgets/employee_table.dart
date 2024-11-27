import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/constants/assets.dart';
import 'employee_table_row.dart';

class EmployeeTable extends StatelessWidget {
  final List employees;
  final int? expandedIndex;
  final ValueChanged<int?> onExpansionChanged;

  const EmployeeTable({
    super.key,
    required this.employees,
    required this.expandedIndex,
    required this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: AppColors.grey10),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.regular16,
              horizontal: AppSpacing.regular16,
            ),
            decoration: const BoxDecoration(
              color: AppColors.blue10,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSpacing.little8),
                topRight: Radius.circular(AppSpacing.little8),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  top: 5,
                  child: SvgPicture.asset(AppAssets.circle),
                ),
                Row(
                  children: [
                    Text(
                      "Foto",
                      style: AppTypography.h2.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: AppSpacing.medium40),
                    Text(
                      "Nome",
                      style: AppTypography.h2.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ...employees.asMap().entries.map((entry) {
            final index = entry.key;
            final employee = entry.value;

            return EmployeeTableRow(
              employee: employee,
              index: index,
              isExpanded: expandedIndex == index,
              totalEmployees: employees.length,
              onExpansionChanged: (expanded) {
                onExpansionChanged(expanded ? index : null);
              },
            );
          })
        ],
      ),
    );
  }
}
