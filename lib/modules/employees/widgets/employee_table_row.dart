import 'package:betalent_test/core/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/constants/assets.dart';
import 'employee_detail_row.dart';

class EmployeeTableRow extends StatelessWidget {
  final dynamic employee;
  final int index;
  final bool isExpanded;
  final int totalEmployees;
  final ValueChanged<bool> onExpansionChanged;

  const EmployeeTableRow({
    super.key,
    required this.employee,
    required this.index,
    required this.isExpanded,
    required this.totalEmployees,
    required this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: index == totalEmployees - 1 ? null : const Border(bottom: BorderSide(color: AppColors.grey10)),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.only(left: AppSpacing.regular16, right: AppSpacing.regular20),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(employee.image),
          radius: 20,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: AppSpacing.regular20),
          child: Text(
            employee.name,
            style: AppTypography.h3.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        trailing: SvgPicture.asset(
          isExpanded ? AppAssets.arrowUp : AppAssets.arrowDown,
        ),
        onExpansionChanged: onExpansionChanged,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmployeeDetailRow(label: "Cargo", value: employee.job),
                EmployeeDetailRow(label: "Data de admissão", value: formatDate(employee.admissionDate)),
                EmployeeDetailRow(label: "Telefone", value: formatPhone(employee.phone)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
