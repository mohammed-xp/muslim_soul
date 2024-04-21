import 'package:dartz/dartz.dart';
import 'package:muslim_soul/core/errors/failure.dart';
import 'package:muslim_soul/features/quran/data/models/surah_model/surah_model.dart';

abstract class QuranRepo {
  Future<Either<Failure, SurahModel>> getAllSurah();
}
