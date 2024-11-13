import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_strucutre_project/core/utils/app_colors.dart';
import 'package:flutter_strucutre_project/features/main_screen/cubit/cubit.dart';
import 'package:flutter_strucutre_project/features/main_screen/cubit/state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.bink,
          body: const Center(
            child: Text('Main Screen'),
          ),
        );
      },
    );
  }
}
