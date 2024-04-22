import 'package:flutter/material.dart';

import '../../../data/models/juz_model/ayah.dart';

class JuzListViewItem extends StatelessWidget {
  const JuzListViewItem({
    super.key,
    required this.surah,
  });

  final Ayah surah;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3.0)]),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black38,
              ),
              child: Text(
                '${surah.surah!.number}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${surah.surah?.englishName}',
                  // surah?.englishName ?? '-----',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${surah.surah?.englishNameTranslation}',
                  // surah?.englishNameTranslation ?? '-----',
                ),
              ],
            ),
            const Spacer(),
            Text(
              '${surah.surah?.name}',
              // surah?.name ?? '----',
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
