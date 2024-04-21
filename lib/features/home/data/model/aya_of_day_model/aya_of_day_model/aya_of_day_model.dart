import 'package:equatable/equatable.dart';

import 'datum.dart';

class AyaOfDayModel extends Equatable {
  final int? code;
  final String? status;
  final List<Datum>? data;

  const AyaOfDayModel({this.code, this.status, this.data});

  factory AyaOfDayModel.fromJson(Map<String, dynamic> json) => AyaOfDayModel(
        code: json['code'] as int?,
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [code, status, data];
}
