import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim_soul/features/quran/data/models/surah_details_model/surah_details_model.dart';
import 'package:muslim_soul/features/quran/data/repos/quran_repo.dart';

part 'surah_details_state.dart';

class SurahDetailsCubit extends Cubit<SurahDetailsState> {
  SurahDetailsCubit(this.quranRepo) : super(SurahDetailsInitial());

  final QuranRepo quranRepo;

  late int surahNumber;

  Future<void> getAllSurah() async {
    emit(SurahDetailsLoading());

    var result = await quranRepo.getSurahDetails(surahNumber: surahNumber);

    result.fold(
      (failure) {
        emit(SurahDetailsFailure(failure.errMessage));
      },
      (surahDetails) {
        emit(SurahDetailsSuccess(surahDetails));
      },
    );
  }
}
