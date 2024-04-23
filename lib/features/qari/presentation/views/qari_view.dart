import 'package:flutter/material.dart';
import 'package:muslim_soul/constants.dart';

import 'widgets/qari_view_body.dart';

class QariView extends StatelessWidget {
  const QariView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.kPrimary,
          title: const Text(
            'Qari\'s',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: const QariViewBody(),
      ),
    );
  }
}
