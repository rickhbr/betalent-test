import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String avatarText;
  final int notificationCount;
  final VoidCallback? onNotificationPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.avatarText,
    this.notificationCount = 0,
    this.onNotificationPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.regular16),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.grey5,
              child: Text(
                avatarText,
                style: AppTypography.h3.copyWith(color: AppColors.black),
              ),
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: SvgPicture.asset(AppAssets.notification),
                onPressed: onNotificationPressed,
              ),
              if (notificationCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$notificationCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      titleTextStyle: AppTypography.h1.copyWith(color: AppColors.black),
      centerTitle: false,
      backgroundColor: AppColors.white,
      elevation: 0,
    );
  }
}
