import 'package:bloc/bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:muslim_soul/constants.dart';
import 'package:muslim_soul/core/network/local/cache_helper.dart';
import 'package:muslim_soul/features/home/data/repos/home_repo.dart';
import 'package:muslim_soul/features/home/presentation/menegar/aya_of_day_cubit/aya_of_day_state.dart';

class AyaOfDayCubit extends Cubit<AyaOfDayState> {
  AyaOfDayCubit(this.homeRepo) : super(AyaOfDayInitial());

  final HomeRepo homeRepo;

  void init() async {
    await CacheHelper.setData(
      key: Constants.kShowOnboarding,
      value: true,
    );
  }

  final hijri = HijriCalendar.now();
  // HijriCalendar.setLocal('ar');

  final day = DateTime.now();
  final DateFormat format = DateFormat('EEE , d MMM yyyy');
  // final formatted = format.format(day);
  final formatted = DateFormat('EEE , d MMM yyyy').format(DateTime.now());

  Future<void> getAyaOfTheDay() async {
    emit(AyaOfDayLoading());

    var result = await homeRepo.getAyaOfDay();

    result.fold(
      (failure) {
        emit(AyaOfDayFailure(failure.errMessage));
      },
      (aya) {
        emit(AyaOfDaySuccess(aya));
      },
    );
  }
}
