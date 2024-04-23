import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final String? id;
  final String? sura;
  final String? aya;
  final String? arabicText;
  final String? translation;
  final String? footnotes;

  const Result({
    this.id,
    this.sura,
    this.aya,
    this.arabicText,
    this.translation,
    this.footnotes,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as String?,
        sura: json['sura'] as String?,
        aya: json['aya'] as String?,
        arabicText: json['arabic_text'] as String?,
        translation: json['translation'] as String?,
        footnotes: json['footnotes'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sura': sura,
        'aya': aya,
        'arabic_text': arabicText,
        'translation': translation,
        'footnotes': footnotes,
      };

  @override
  List<Object?> get props {
    return [
      id,
      sura,
      aya,
      arabicText,
      translation,
      footnotes,
    ];
  }
}
