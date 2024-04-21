part of 'surah_cubit.dart';

sealed class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

final class SurahInitial extends SurahState {}

final class SurahLoading extends SurahState {}

final class SurahSuccess extends SurahState {
  final SurahModel surah;

  const SurahSuccess(this.surah);
}

final class SurahFailure extends SurahState {
  final String errMessage;

  const SurahFailure(this.errMessage);
}
