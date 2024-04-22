import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final int? numberOfAyahs;

  const Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json['number'] as int?,
        name: json['name'] as String?,
        englishName: json['englishName'] as String?,
        englishNameTranslation: json['englishNameTranslation'] as String?,
        revelationType: json['revelationType'] as String?,
        numberOfAyahs: json['numberOfAyahs'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'name': name,
        'englishName': englishName,
        'englishNameTranslation': englishNameTranslation,
        'revelationType': revelationType,
        'numberOfAyahs': numberOfAyahs,
      };

  @override
  List<Object?> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      revelationType,
      numberOfAyahs,
    ];
  }
}
