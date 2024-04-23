import 'package:equatable/equatable.dart';

class QarisModel extends Equatable {
  final int? id;
  final String? name;
  final String? arabicName;
  final String? relativePath;
  final String? fileFormats;
  final int? sectionId;
  final bool? home;
  final dynamic description;
  final String? torrentFilename;
  final String? torrentInfoHash;
  final int? torrentSeeders;
  final int? torrentLeechers;

  const QarisModel({
    this.id,
    this.name,
    this.arabicName,
    this.relativePath,
    this.fileFormats,
    this.sectionId,
    this.home,
    this.description,
    this.torrentFilename,
    this.torrentInfoHash,
    this.torrentSeeders,
    this.torrentLeechers,
  });

  factory QarisModel.fromJson(Map<String, dynamic> json) => QarisModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        arabicName: json['arabic_name'] as String?,
        relativePath: json['relative_path'] as String?,
        fileFormats: json['file_formats'] as String?,
        sectionId: json['section_id'] as int?,
        home: json['home'] as bool?,
        description: json['description'] as dynamic,
        torrentFilename: json['torrent_filename'] as String?,
        torrentInfoHash: json['torrent_info_hash'] as String?,
        torrentSeeders: json['torrent_seeders'] as int?,
        torrentLeechers: json['torrent_leechers'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'arabic_name': arabicName,
        'relative_path': relativePath,
        'file_formats': fileFormats,
        'section_id': sectionId,
        'home': home,
        'description': description,
        'torrent_filename': torrentFilename,
        'torrent_info_hash': torrentInfoHash,
        'torrent_seeders': torrentSeeders,
        'torrent_leechers': torrentLeechers,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      arabicName,
      relativePath,
      fileFormats,
      sectionId,
      home,
      description,
      torrentFilename,
      torrentInfoHash,
      torrentSeeders,
      torrentLeechers,
    ];
  }
}
