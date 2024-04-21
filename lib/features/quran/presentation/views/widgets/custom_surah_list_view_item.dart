import 'package:flutter/material.dart';
import 'package:muslim_soul/features/quran/data/models/surah_model/datum.dart';

class CustomSurahListViewItem extends StatelessWidget {
  const CustomSurahListViewItem({super.key, required this.surah});
  final Datum? surah;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                surah?.number.toString() ?? '--',
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
                  surah?.englishName ?? '-----',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  surah?.englishNameTranslation ?? '-----',
                ),
              ],
            ),
            const Spacer(),
            Text(
              surah?.name ?? '----',
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
