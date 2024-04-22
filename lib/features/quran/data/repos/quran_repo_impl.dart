import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:muslim_soul/core/errors/failure.dart';
import 'package:muslim_soul/core/utils/api_services.dart';
import 'package:muslim_soul/features/quran/data/models/juz_model/juz_model.dart';
import 'package:muslim_soul/features/quran/data/models/surah_model/surah_model.dart';
import 'package:muslim_soul/features/quran/data/repos/quran_repo.dart';

class QuranRepoImpl extends QuranRepo {
  final ApiServices apiServices;

  QuranRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, SurahModel>> getAllSurah() async {
    try {
      var data = await apiServices.get(
        endPoint: 'surah',
      );

      SurahModel surahModel = SurahModel.fromJson(data);

      return right(surahModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, JuzModel>> getJuz({required int juzNumber}) async {
    try {
      var data = await apiServices.get(
        endPoint: 'juz/$juzNumber/quran-uthmani',
      );

      JuzModel juzModel = JuzModel.fromJson(data);

      return right(juzModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
