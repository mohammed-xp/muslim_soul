import 'package:equatable/equatable.dart';

import 'result.dart';

class SurahDetailsModel extends Equatable {
  final List<Result>? result;

  const SurahDetailsModel({this.result});

  factory SurahDetailsModel.fromJson(Map<String, dynamic> json) {
    return SurahDetailsModel(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [result];
}
