import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/typography.dart';

class EmployeeDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const EmployeeDetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.h2.copyWith(color: AppColors.black)),
          Text(value, style: AppTypography.h3.copyWith(color: AppColors.black)),
        ],
      ),
    );
  }
}
