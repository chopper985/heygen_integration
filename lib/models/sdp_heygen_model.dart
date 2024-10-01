import 'dart:convert';

class SDPHeyGenModel {
  final String type;
  final String sdp;
  SDPHeyGenModel({
    required this.type,
    required this.sdp,
  });

  SDPHeyGenModel copyWith({
    String? type,
    String? sdp,
  }) {
    return SDPHeyGenModel(
      type: type ?? this.type,
      sdp: sdp ?? this.sdp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'sdp': sdp,
    };
  }

  factory SDPHeyGenModel.fromMap(Map<String, dynamic> map) {
    return SDPHeyGenModel(
      type: map['type'] as String,
      sdp: map['sdp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SDPHeyGenModel.fromJson(String source) =>
      SDPHeyGenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SDPHeyGenModel(type: $type, sdp: $sdp)';
}
