import 'package:flutter/material.dart';

import 'widgets/qari_view_body.dart';

class QariView extends StatelessWidget {
  const QariView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Qari\'s'),
          centerTitle: true,
        ),
        body: const QariViewBody(),
      ),
    );
  }
}
