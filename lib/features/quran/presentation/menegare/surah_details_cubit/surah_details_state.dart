part of 'surah_details_cubit.dart';

sealed class SurahDetailsState extends Equatable {
  const SurahDetailsState();

  @override
  List<Object> get props => [];
}

final class SurahDetailsInitial extends SurahDetailsState {}

final class SurahDetailsLoading extends SurahDetailsState {}

final class SurahDetailsSuccess extends SurahDetailsState {
  final SurahDetailsModel surahDetails;

  const SurahDetailsSuccess(this.surahDetails);
}

final class SurahDetailsFailure extends SurahDetailsState {
  final String errMessage;

  const SurahDetailsFailure(this.errMessage);
}
