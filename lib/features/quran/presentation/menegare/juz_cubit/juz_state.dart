part of 'juz_cubit.dart';

sealed class JuzState extends Equatable {
  const JuzState();

  @override
  List<Object> get props => [];
}

final class JuzInitial extends JuzState {}

final class JuzLoading extends JuzState {}

final class JuzSuccess extends JuzState {
  final JuzModel juz;

  const JuzSuccess(this.juz);
}

final class JuzFailure extends JuzState {
  final String errMessage;

  const JuzFailure(this.errMessage);
}
