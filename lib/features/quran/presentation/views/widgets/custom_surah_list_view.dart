import 'package:flutter/material.dart';
import 'package:muslim_soul/features/quran/presentation/views/widgets/custom_surah_list_view_item.dart';

import '../../../data/models/surah_model/surah_model.dart';

class CustomSurahListView extends StatelessWidget {
  const CustomSurahListView({super.key, required this.allSurah});

  final SurahModel allSurah;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allSurah.data?.length ?? 0,
      itemBuilder: (context, index) {
        var surah = allSurah.data?[index];
        return CustomSurahListViewItem(
          surah: surah,
        );
      },
    );
  }
}
