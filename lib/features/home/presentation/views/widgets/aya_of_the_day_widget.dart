import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_soul/core/widgets/custom_error_widget.dart';
import 'package:muslim_soul/core/widgets/custom_loading.dart';
import 'package:muslim_soul/features/home/presentation/menegar/aya_of_day_cubit/aya_of_day_cubit.dart';
import 'package:muslim_soul/features/home/presentation/menegar/aya_of_day_cubit/aya_of_day_state.dart';

class AyaOfTheDayWidget extends StatelessWidget {
  const AyaOfTheDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AyaOfDayCubit, AyaOfDayState>(
      builder: (context, state) {
        if (state is AyaOfDaySuccess) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsetsDirectional.only(
                top: 10,
                bottom: 20,
                end: 20,
                start: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 0.3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Quran Aya of the day',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                  Text(
                    state.ayaOfDayModel.data?[0].text ?? '----',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Interpretation',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    state.ayaOfDayModel.data?[2].text ?? '----',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state.ayaOfDayModel.data?[0].numberInSurah
                                        .toString() ??
                                    '--',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "(${state.ayaOfDayModel.data?[0].surah?.englishName ?? '----'})",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state.ayaOfDayModel.data?[0].surah?.name ??
                                    '---',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is AyaOfDayFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
            onPressed: () {
              BlocProvider.of<AyaOfDayCubit>(context).getAyaOfTheDay();
            },
          );
        } else {
          return const CustomLoading();
        }
      },
    );
  }
}
