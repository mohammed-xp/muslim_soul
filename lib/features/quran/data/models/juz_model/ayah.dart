import 'package:equatable/equatable.dart';

import 'surah.dart';

class Ayah extends Equatable {
  final int? number;
  final String? text;
  final Surah? surah;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  // final bool? sajda;

  const Ayah({
    this.number,
    this.text,
    this.surah,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    // this.sajda,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json['number'] as int?,
        text: json['text'] as String?,
        surah: json['surah'] == null
            ? null
            : Surah.fromJson(json['surah'] as Map<String, dynamic>),
        numberInSurah: json['numberInSurah'] as int?,
        juz: json['juz'] as int?,
        manzil: json['manzil'] as int?,
        page: json['page'] as int?,
        ruku: json['ruku'] as int?,
        hizbQuarter: json['hizbQuarter'] as int?,
        // sajda: json['sajda'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'text': text,
        'surah': surah?.toJson(),
        'numberInSurah': numberInSurah,
        'juz': juz,
        'manzil': manzil,
        'page': page,
        'ruku': ruku,
        'hizbQuarter': hizbQuarter,
        // 'sajda': sajda,
      };

  @override
  List<Object?> get props {
    return [
      number,
      text,
      surah,
      numberInSurah,
      juz,
      manzil,
      page,
      ruku,
      hizbQuarter,
      // sajda,
    ];
  }
}
