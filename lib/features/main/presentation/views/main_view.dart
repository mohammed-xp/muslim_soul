import 'package:flutter/material.dart';
import 'package:muslim_soul/features/audio/presentation/views/audio_view.dart';
import 'package:muslim_soul/features/home/presentation/views/home_view.dart';
import 'package:muslim_soul/features/prayer/presentation/views/prayer_view.dart';
import 'package:muslim_soul/features/quran/presentation/views/quran_view.dart';

import 'widgets/custom_bottom_navigation_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectIndex = 0;
  final List<Widget> _viewsList = [
    const HomeView(),
    const QuranView(),
    const QarisView(),
    const PrayerView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _viewsList[selectIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          updateIndex: updateIndex,
        ),
      ),
    );
  }

  void updateIndex(int index) {
    setState(() {
      selectIndex = index;
    });
  }
}
