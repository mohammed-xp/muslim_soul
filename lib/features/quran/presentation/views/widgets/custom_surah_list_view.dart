import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_soul/core/utils/app_router.dart';
import 'package:muslim_soul/features/quran/presentation/menegare/surah_details_cubit/surah_details_cubit.dart';
import 'package:muslim_soul/features/quran/presentation/views/widgets/surah_list_view_item.dart';

import '../../../data/models/surah_model/surah_model.dart';

class CustomSurahListView extends StatelessWidget {
  const CustomSurahListView({super.key, required this.allSurah});

  final SurahModel allSurah;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: false,
      slivers: [
        SliverList.builder(
          // physics: const BouncingScrollPhysics(),
          itemCount: allSurah.data?.length ?? 0,
          itemBuilder: (context, index) {
            var surah = allSurah.data?[index];
            return SurahListViewItem(
              surahNumber: surah?.number.toString() ?? '--',
              surahEnglishName: surah?.englishName ?? '-----',
              numberOfAyahs: surah?.numberOfAyahs.toString() ?? '---',
              surahName: surah?.name ?? '-----',
              onTap: () {
                int surahNumber = surah?.number ?? 1;
                String title = '${surah?.name} - ${surah?.englishName}';
                BlocProvider.of<SurahDetailsCubit>(context).getSurahDetails(
                  surahNumber: surahNumber,
                  title: title,
                );
                GoRouter.of(context).push(AppRouter.kSurahDetailsView);
              },
            );
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 28,
          ),
        ),
      ],
      // child: ListView.builder(
      //   physics: const BouncingScrollPhysics(),
      //   itemCount: allSurah.data?.length ?? 0,
      //   itemBuilder: (context, index) {
      //     var surah = allSurah.data?[index];
      //     return CustomSurahListViewItem(
      //       surah: surah,
      //     );
      //   },
      // ),
    );
  }
}
