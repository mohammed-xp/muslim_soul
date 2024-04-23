import 'package:flutter/material.dart';
import 'package:muslim_soul/constants.dart';
import 'package:muslim_soul/features/quran/presentation/views/widgets/juz_body.dart';
import 'package:muslim_soul/features/quran/presentation/views/widgets/surah_body.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.kPrimary,
            title: const Text(
              'Quran',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Text(
                  'Surah',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Juz',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SurahBody(),
              JuzBody(),
            ],
          ),
        ),
      ),
    );
  }
}
