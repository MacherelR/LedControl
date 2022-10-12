

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/home_cubit.dart';
import '../LedTuner/tuner_page.dart';
import 'SettingsScreen.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  static const String route = "/home";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget{
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED Control'),
      ),
      body: selectedTab == HomeTab.tuner
          ? const TunerScreen()
              : const SettingsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: HomeTab.values.indexOf(selectedTab),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.tune), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        onTap: (index) {
          context.read<HomeCubit>().setTab(HomeTab.values[index]);
        },
      ),
    );
  }
}