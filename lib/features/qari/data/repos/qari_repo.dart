import 'package:dartz/dartz.dart';
import 'package:muslim_soul/core/errors/failure.dart';
import 'package:muslim_soul/features/qari/data/models/qaris_model/qaris_model.dart';

abstract class QariRepo {
  Future<Either<Failure, List<QarisModel>>> getQaris();
}
