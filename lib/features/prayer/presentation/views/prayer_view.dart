import 'package:flutter/material.dart';

class PrayerView extends StatelessWidget {
  const PrayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Prayer View'),
        ),
      ),
    );
  }
}
