import 'package:flutter/material.dart';
import 'package:flutter_strucutre_project/core/utils/app_colors.dart';

import '../../../../config/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue1,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.mainRoute);
            },
            child: const Text('Nav To Main Screen')),
      ),
    );
  }
}
