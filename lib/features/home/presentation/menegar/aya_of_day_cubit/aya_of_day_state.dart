import 'package:muslim_soul/features/home/data/model/aya_of_day_model/aya_of_day_model/aya_of_day_model.dart';

sealed class AyaOfDayState {}

final class AyaOfDayInitial extends AyaOfDayState {}

final class AyaOfDayLoading extends AyaOfDayState {}

final class AyaOfDaySuccess extends AyaOfDayState {
  final AyaOfDayModel ayaOfDayModel;

  AyaOfDaySuccess(this.ayaOfDayModel);
}

final class AyaOfDayFailure extends AyaOfDayState {
  final String errMessage;

  AyaOfDayFailure(this.errMessage);
}
