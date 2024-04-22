import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_soul/core/utils/app_router.dart';
import 'package:muslim_soul/features/quran/presentation/menegare/juz_cubit/juz_cubit.dart';

class JuzBody extends StatelessWidget {
  const JuzBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 30,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(13),
                onTap: () {
                  BlocProvider.of<JuzCubit>(context).index = index + 1;
                  BlocProvider.of<JuzCubit>(context).getJuz();
                  GoRouter.of(context).push(AppRouter.kJuzView);
                },
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 28,
          ),
        ),
      ],
    );
  }
}
