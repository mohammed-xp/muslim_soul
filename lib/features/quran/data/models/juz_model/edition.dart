import 'package:equatable/equatable.dart';

class Edition extends Equatable {
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;
  final String? direction;

  const Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json['identifier'] as String?,
        language: json['language'] as String?,
        name: json['name'] as String?,
        englishName: json['englishName'] as String?,
        format: json['format'] as String?,
        type: json['type'] as String?,
        direction: json['direction'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'identifier': identifier,
        'language': language,
        'name': name,
        'englishName': englishName,
        'format': format,
        'type': type,
        'direction': direction,
      };

  @override
  List<Object?> get props {
    return [
      identifier,
      language,
      name,
      englishName,
      format,
      type,
      direction,
    ];
  }
}
