import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:muslim_soul/features/quran/data/repos/quran_repo.dart';

import '../../../data/models/juz_model/juz_model.dart';

part 'juz_state.dart';

class JuzCubit extends Cubit<JuzState> {
  JuzCubit(this.quranRepo) : super(JuzInitial());

  final QuranRepo quranRepo;

  late int index;

  Future<void> getJuz() async {
    emit(JuzLoading());

    var result = await quranRepo.getJuz(juzNumber: index);

    result.fold(
      (failure) {
        emit(JuzFailure(failure.errMessage));
      },
      (juz) {
        emit(JuzSuccess(juz));
      },
    );
  }
}
