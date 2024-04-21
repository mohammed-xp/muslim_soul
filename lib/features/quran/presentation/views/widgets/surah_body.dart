import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_soul/core/widgets/custom_loading.dart';
import 'package:muslim_soul/features/quran/presentation/menegare/surah_cubit/surah_cubit.dart';
import 'package:muslim_soul/features/quran/presentation/views/widgets/custom_surah_list_view.dart';

import '../../../../../core/widgets/custom_error_widget.dart';

class SurahBody extends StatelessWidget {
  const SurahBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state is SurahSuccess) {
          return CustomSurahListView(
            allSurah: state.surah,
          );
        } else if (state is SurahFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
            onPressed: () {
              BlocProvider.of<SurahCubit>(context).getAllSurah();
            },
          );
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}
