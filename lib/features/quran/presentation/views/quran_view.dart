import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_soul/constants.dart';
import 'package:muslim_soul/core/widgets/custom_error_widget.dart';
import 'package:muslim_soul/core/widgets/custom_loading.dart';
import 'package:muslim_soul/features/quran/presentation/menegare/surah_cubit/surah_cubit.dart';
import 'package:muslim_soul/features/quran/presentation/views/widgets/custom_surah_list_view.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.kPrimary,
            title: const Text('Quran'),
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Text(
                  'Surah',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Sajda',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Juz',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            SurahBody(),
            Center(child: Text('Sajda')),
            Center(child: Text('Juz')),
          ]),
        ),
      ),
    );
  }
}

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
