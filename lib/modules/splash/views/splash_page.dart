import 'package:animations/animations.dart';
import 'package:betalent_test/core/constants/assets.dart';
import 'package:betalent_test/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _showLogo = true;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _showLogo = false;
    });

    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/employeeTable');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 800),
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
            return SharedAxisTransition(
              fillColor: Colors.transparent,
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: _showLogo
              ? SvgPicture.asset(
                  AppAssets.beTalentLogo,
                  key: const ValueKey('logo'),
                )
              : const SizedBox.shrink(
                  key: ValueKey('empty'),
                ),
        ),
      ),
    );
  }
}
