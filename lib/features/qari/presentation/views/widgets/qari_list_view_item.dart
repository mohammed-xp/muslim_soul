import 'package:flutter/material.dart';

import '../../../data/models/qaris_model/qaris_model.dart';

class QariListViewItem extends StatelessWidget {
  const QariListViewItem({super.key, required this.qari});

  final QarisModel qari;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(4.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 0,
              color: Colors.black12,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              qari.name ?? '------',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
