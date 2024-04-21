import 'package:flutter/material.dart';
import 'package:muslim_soul/features/home/presentation/views/widgets/aya_of_the_day_widget.dart';
import 'widgets/DateWidget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            DateWidget(),
            AyaOfTheDayWidget(),
          ],
        ),
      ),
    );
  }
}
