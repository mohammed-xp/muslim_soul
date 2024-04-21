import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_soul/features/home/presentation/menegar/aya_of_day_cubit/aya_of_day_state.dart';

import '../../../../../core/utils/assets.dart';
import '../../menegar/aya_of_day_cubit/aya_of_day_cubit.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.22,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AssetsData.backgroundImage,
          ),
        ),
      ),
      child:
          BlocBuilder<AyaOfDayCubit, AyaOfDayState>(builder: (context, state) {
        var cubit = BlocProvider.of<AyaOfDayCubit>(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cubit.formatted,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cubit.hijri.hDay.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cubit.hijri.longMonthName,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${cubit.hijri.hYear} AH',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
