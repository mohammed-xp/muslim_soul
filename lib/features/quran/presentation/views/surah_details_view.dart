import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_soul/constants.dart';
import 'package:muslim_soul/core/widgets/custom_error_widget.dart';
import 'package:muslim_soul/core/widgets/custom_loading.dart';
import 'package:muslim_soul/features/quran/presentation/menegare/surah_details_cubit/surah_details_cubit.dart';
import 'package:muslim_soul/features/quran/presentation/views/widgets/surah_details_list_view.dart';

class SurahDetailsView extends StatelessWidget {
  const SurahDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.kPrimary,
        title: Text(
          BlocProvider.of<SurahDetailsCubit>(context).title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<SurahDetailsCubit, SurahDetailsState>(
        builder: (context, state) {
          if (state is SurahDetailsSuccess) {
            return SurahDetailsListView(
              state: state,
            );
          } else if (state is SurahDetailsFailure) {
            return CustomErrorWidget(
              errMessage: state.errMessage,
              onPressed: () {
                var surahNumber =
                    BlocProvider.of<SurahDetailsCubit>(context).surahNumber;
                var title = BlocProvider.of<SurahDetailsCubit>(context).title;
                BlocProvider.of<SurahDetailsCubit>(context).getSurahDetails(
                  surahNumber: surahNumber,
                  title: title,
                );
              },
            );
          } else {
            return const CustomLoading();
          }
        },
      ),
    );
  }
}
