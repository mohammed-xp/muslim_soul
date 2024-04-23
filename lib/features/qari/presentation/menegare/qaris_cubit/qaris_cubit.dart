import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/qaris_model/qaris_model.dart';
import '../../../data/repos/qari_repo.dart';

part 'qaris_state.dart';

class QarisCubit extends Cubit<QarisState> {
  QarisCubit(this.qariRepo) : super(QarisInitial());

  final QariRepo qariRepo;

  Future<void> getQaris() async {
    emit(QarisLoading());

    var result = await qariRepo.getQaris();

    result.fold(
      (failure) {
        emit(QarisFailure(failure.errMessage));
      },
      (qaris) {
        emit(QarisSuccess(qaris));
      },
    );
  }
}
