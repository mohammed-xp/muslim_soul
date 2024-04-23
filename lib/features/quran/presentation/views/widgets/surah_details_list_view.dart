import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/surah_details_model/result.dart';
import '../../menegare/surah_details_cubit/surah_details_cubit.dart';
import 'surah_details_list_view_item.dart';

class SurahDetailsListView extends StatelessWidget {
  const SurahDetailsListView({
    super.key,
    required this.state,
  });

  final SurahDetailsSuccess state;
  // final surahNumber;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        if (BlocProvider.of<SurahDetailsCubit>(context).surahNumber != 1 &&
            BlocProvider.of<SurahDetailsCubit>(context).surahNumber != 9)
          const SliverToBoxAdapter(
            child: SurahDetailsListViewItem(
                ayah: Result(
              arabicText: 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
              aya: '',
              translation:
                  '(1) In the name of Allāh,[2] the Entirely Merciful, the Especially Merciful.[3]',
              footnotes: '',
              id: '0',
            )),
          ),
        SliverList.builder(
          // physics: const BouncingScrollPhysics(),
          itemCount: state.surahDetails.result?.length,
          itemBuilder: (context, index) {
            Result ayah = state.surahDetails.result![index];

            return SurahDetailsListViewItem(ayah: ayah);
          },
        ),
      ],
    );
  }
}
