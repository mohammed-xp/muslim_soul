import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim_soul/features/quran/data/models/surah_details_model/surah_details_model.dart';
import 'package:muslim_soul/features/quran/data/repos/quran_repo.dart';

part 'surah_details_state.dart';

class SurahDetailsCubit extends Cubit<SurahDetailsState> {
  SurahDetailsCubit(this.quranRepo) : super(SurahDetailsInitial());

  final QuranRepo quranRepo;

  late int surahNumber;

  String title = '';

  Future<void> getSurahDetails({
    required int surahNumber,
    required String title,
  }) async {
    emit(SurahDetailsLoading());

    this.surahNumber = surahNumber;
    this.title = title;

    var result = await quranRepo.getSurahDetails(surahNumber: this.surahNumber);

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
