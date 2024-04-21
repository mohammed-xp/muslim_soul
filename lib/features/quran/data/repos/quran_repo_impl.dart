import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:muslim_soul/core/errors/failure.dart';
import 'package:muslim_soul/core/utils/api_services.dart';
import 'package:muslim_soul/features/quran/data/models/surah_model/surah_model.dart';
import 'package:muslim_soul/features/quran/data/repos/quran_repo.dart';

class QuranRepoImpl extends QuranRepo {
  final ApiServices apiServices;

  QuranRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, SurahModel>> getAllSurah() async {
    try {
      // For random Aya we need to generate random number
      var data = await apiServices.getAyaOfDay(
        endPoint: 'surah',
      );

      // List<BookModel> books = [];
      // for (var item in data['items']) {
      //   books.add(BookModel.fromJson(item));
      // }
      SurahModel surahModel = SurahModel.fromJson(data);

      return right(surahModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
