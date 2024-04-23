part of 'qaris_cubit.dart';

sealed class QarisState extends Equatable {
  const QarisState();

  @override
  List<Object> get props => [];
}

final class QarisInitial extends QarisState {}

final class QarisLoading extends QarisState {}

final class QarisSuccess extends QarisState {
  final List<QarisModel> qaris;

  const QarisSuccess(this.qaris);
}

final class QarisFailure extends QarisState {
  final String errMessage;

  const QarisFailure(this.errMessage);
}
