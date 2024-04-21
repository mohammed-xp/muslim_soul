import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_soul/features/home/presentation/menegar/aya_of_day_cubit/aya_of_day_cubit.dart';
import 'package:muslim_soul/features/home/presentation/menegar/aya_of_day_cubit/aya_of_day_state.dart';

class AyaOfTheDayWidget extends StatelessWidget {
  const AyaOfTheDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AyaOfDayCubit, AyaOfDayState>(
      builder: (context, state) {
        if (state is AyaOfDaySuccess) {
          return Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 10,
                  bottom: 20,
                ),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(32)),
                  child: Column(
                    children: [
                      const Text(
                        'Quran Aya of the day',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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
                        ),
                      ),
                      Text(
                        state.ayaOfDayModel.data?[2].text ?? '----',
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.ayaOfDayModel.data?[0].numberInSurah
                                          .toString() ??
                                      '--',
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "(${state.ayaOfDayModel.data?[0].surah?.englishName ?? '----'})",
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
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is AyaOfDayFailure) {
          print(state.errMessage);
          return Text('Error: ${state.errMessage}');
        } else {
          print('Loading');
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
