import 'package:betalent_test/modules/employees/views/employee_tablet_page.dart';
import 'package:betalent_test/modules/splash/views/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeTalent test',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/employeeTable': (context) => EmployeeTablePage(),
      },
    );
  }
}
