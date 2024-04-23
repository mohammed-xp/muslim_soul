import 'package:flutter/material.dart';

class QariView extends StatelessWidget {
  const QariView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Audio View'),
        ),
      ),
    );
  }
}
