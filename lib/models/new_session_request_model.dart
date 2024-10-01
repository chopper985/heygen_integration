import 'dart:convert';

import 'package:hey_gen/models/index.dart';

class NewSessionRequestModel {
  final QualityEnum quality;
  final String? avatarId;
  final VoiceSetting? voice;
  final String? videoEncoding;
  final String? knowledgeBase;
  final String? version;
  final String? knowledgeBaseId;
  NewSessionRequestModel({
    this.quality = QualityEnum.medium,
    this.avatarId,
    this.voice,
    this.videoEncoding = "H264",
    this.knowledgeBase,
    this.version,
    this.knowledgeBaseId,
  });

  Map<String, dynamic> toMap() {
    final body = <String, dynamic>{
      'quality': quality.quality,
      'avatar_id': avatarId,
      'voice': voice?.toMap(),
      'video_encoding': videoEncoding,
      'knowledge_base': knowledgeBase,
      'version': version,
      'knowledge_base_id': knowledgeBaseId,
    };

    body.removeWhere((key, value) => value == null);

    return body;
  }

  factory NewSessionRequestModel.fromMap(Map<String, dynamic> map) {
    return NewSessionRequestModel(
      quality: (map['quality'] as String).getQualityEnum,
      avatarId: map['avatar_id'] ?? "",
      voice: map['voice'] != null
          ? VoiceSetting.fromMap(map['voice'] as Map<String, dynamic>)
          : null,
      videoEncoding: map['video_encoding'] != null
          ? map['video_encoding'] as String
          : null,
      knowledgeBase: map['knowledge_base'] != null
          ? map['knowledge_base'] as String
          : null,
      version: map['version'] != null ? map['version'] as String : null,
      knowledgeBaseId: map['knowledgeBaseId'] != null
          ? map['knowledge_base_id'] as String
          : null,
    );
  }

  factory NewSessionRequestModel.fromJson(String source) =>
      NewSessionRequestModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'GetSessionBodyModel(quality: $quality, avatarId: $avatarId, voice: $voice, videoEncoding: $videoEncoding, knowledgeBase: $knowledgeBase, version: $version, knowledgeBaseId: $knowledgeBaseId)';
  }
}
