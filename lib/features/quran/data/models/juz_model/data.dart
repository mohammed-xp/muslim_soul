import 'package:equatable/equatable.dart';

import 'ayah.dart';
import 'edition.dart';

class Data extends Equatable {
  final int? number;
  final List<Ayah>? ayahs;
  final Edition? edition;

  const Data({this.number, this.ayahs, this.edition});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        number: json['number'] as int?,
        ayahs: (json['ayahs'] as List<dynamic>?)
            ?.map((e) => Ayah.fromJson(e as Map<String, dynamic>))
            .toList(),
        edition: json['edition'] == null
            ? null
            : Edition.fromJson(json['edition'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'ayahs': ayahs?.map((e) => e.toJson()).toList(),
        'edition': edition?.toJson(),
      };

  @override
  List<Object?> get props => [number, ayahs, edition];
}
