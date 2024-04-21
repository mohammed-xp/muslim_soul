import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/aya_of_day_model/aya_of_day_model/aya_of_day_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, AyaOfDayModel>> getAyaOfDay();
}
