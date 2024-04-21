import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:muslim_soul/core/utils/api_services.dart';
import 'package:muslim_soul/features/home/data/repos/home_repo.dart';

import '../../../../core/errors/failure.dart';
import '../model/aya_of_day_model/aya_of_day_model/aya_of_day_model.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AyaOfDayModel>> getAyaOfDay() async {
    try {
      // For random Aya we need to generate random number
      var data = await apiService.getAyaOfDay(
        endPoint:
            'ayah/${random(1, 6236)}/editions/quran-uthmani,en.asad,en.pickthall',
      );

      // List<BookModel> books = [];
      // for (var item in data['items']) {
      //   books.add(BookModel.fromJson(item));
      // }
      AyaOfDayModel aya = AyaOfDayModel.fromJson(data);

      return right(aya);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  int random(int min, int max) {
    var rn = Random();
    return min + rn.nextInt(max - min);
  }
}
