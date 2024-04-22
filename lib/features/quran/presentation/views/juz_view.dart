import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_soul/constants.dart';
import 'package:muslim_soul/core/widgets/custom_error_widget.dart';
import 'package:muslim_soul/core/widgets/custom_loading.dart';
import 'package:muslim_soul/features/quran/presentation/menegare/juz_cubit/juz_cubit.dart';
import 'widgets/juz_list_view.dart';

class JuzView extends StatelessWidget {
  const JuzView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.kPrimary,
          title: Text(
            'Juz ${BlocProvider.of<JuzCubit>(context).index}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          // centerTitle: true,
          leading: SizedBox(),
        ),
        body: BlocBuilder<JuzCubit, JuzState>(
          builder: (context, state) {
            if (state is JuzSuccess) {
              var surahs = state.juz.data!.ayahs;
              var surahNumber = surahs!.map((e) => e.surah!.number).toSet();
              surahs.retainWhere((s) => surahNumber.remove(s.surah!.number));
              return JuzListView(surahs: surahs);
            } else if (state is JuzFailure) {
              return CustomErrorWidget(
                errMessage: state.errMessage,
                onPressed: () {
                  BlocProvider.of<JuzCubit>(context).getJuz();
                },
              );
            } else {
              return const CustomLoading();
            }
          },
        ),
      ),
    );
  }
}
