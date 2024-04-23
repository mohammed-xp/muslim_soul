import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:muslim_soul/core/errors/failure.dart';
import 'package:muslim_soul/core/utils/api_services.dart';
import 'package:muslim_soul/features/qari/data/models/qaris_model/qaris_model.dart';
import 'package:muslim_soul/features/qari/data/repos/qari_repo.dart';

class QariRepoImpl extends QariRepo {
  final ApiServices apiServices;

  QariRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<QarisModel>>> getQaris() async {
    try {
      var data = await apiServices.getFromQuranicAudio(
        endPoint: 'qaris',
      );

      List<QarisModel> qarisModel = [];

      for (var item in data) {
        qarisModel.add(QarisModel.fromJson(item));
      }

      return right(qarisModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
