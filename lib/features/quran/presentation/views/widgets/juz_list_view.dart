import 'package:flutter/material.dart';
import 'package:muslim_soul/features/quran/presentation/views/widgets/surah_list_view_item.dart';

import '../../../data/models/juz_model/ayah.dart';

class JuzListView extends StatelessWidget {
  const JuzListView({
    super.key,
    required this.surahs,
  });

  final List<Ayah> surahs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: surahs.length,
      itemBuilder: (context, index) {
        var surah = surahs[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: SurahListViewItem(
            surahNumber: surah.surah?.number.toString() ?? '--',
            surahEnglishName: surah.surah?.englishName ?? '-----',
            numberOfAyahs: surah.surah?.numberOfAyahs.toString() ?? '---',
            surahName: surah.surah?.name ?? '-----',
            onTap: () {},
          ),
        );
      },
    );
  }
}
