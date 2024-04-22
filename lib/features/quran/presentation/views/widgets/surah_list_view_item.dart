import 'package:flutter/material.dart';

class SurahListViewItem extends StatelessWidget {
  const SurahListViewItem({
    super.key,
    required this.surahNumber,
    required this.surahEnglishName,
    required this.numberOfAyahs,
    required this.surahName,
  });

  final String surahNumber;
  final String surahEnglishName;
  final String numberOfAyahs;
  final String surahName;

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
                surahNumber,
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
                  surahEnglishName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$numberOfAyahs  ayah',
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              surahName,
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
