// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VoiceSetting {
  final String voiceId;
  final double? rate;
  final String? emotion;

  VoiceSetting({required this.voiceId, this.rate, this.emotion});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'voice_id': voiceId,
      'rate': rate,
      'emotion': emotion,
    };
  }

  factory VoiceSetting.fromMap(Map<String, dynamic> map) {
    return VoiceSetting(
      voiceId: map['voice_id'] ?? "",
      rate: map['rate'] != null ? map['rate'] as double : null,
      emotion: map['emotion'] != null ? map['emotion'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VoiceSetting.fromJson(String source) =>
      VoiceSetting.fromMap(json.decode(source) as Map<String, dynamic>);
}
