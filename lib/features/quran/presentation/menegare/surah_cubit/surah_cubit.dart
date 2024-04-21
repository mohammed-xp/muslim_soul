import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim_soul/features/quran/data/models/surah_model/surah_model.dart';
import 'package:muslim_soul/features/quran/data/repos/quran_repo.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.quranRepo) : super(SurahInitial());

  final QuranRepo quranRepo;

  Future<void> getAllSurah() async {
    emit(SurahLoading());

    var result = await quranRepo.getAllSurah();

    result.fold(
      (failure) {
        emit(SurahFailure(failure.errMessage));
      },
      (surah) {
        emit(SurahSuccess(surah));
      },
    );
  }
}
