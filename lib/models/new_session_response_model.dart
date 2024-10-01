import 'dart:convert';

import 'package:hey_gen/models/sdp_heygen_model.dart';

class ICEModel {
  final String credential;
  final List<String> urls;
  final String username;
  ICEModel({
    required this.credential,
    required this.urls,
    required this.username,
  });

  ICEModel copyWith({
    String? credential,
    String? username,
    List<String>? urls,
  }) {
    return ICEModel(
      credential: credential ?? this.credential,
      urls: urls ?? this.urls,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'credential': credential,
      'urls': urls,
      'username': username,
    };
  }

  factory ICEModel.fromMap(Map<String, dynamic> map) {
    return ICEModel(
      credential: map['credential'] ?? "",
      urls: (map['urls'] as List)
          .whereType<String>()
          .map((url) => url.toString())
          .toList(),
      username: map['username'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ICEModel.fromJson(String source) =>
      ICEModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ICEModel(credential: $credential, urls: $urls, username: $username)';
}

class NewSessionResponseModel {
  final int code;
  final String message;
  final List<ICEModel> iceServers2;
  final SDPHeyGenModel? sdp;
  final String sessionId;
  NewSessionResponseModel({
    required this.code,
    required this.message,
    required this.iceServers2,
    this.sdp,
    required this.sessionId,
  });

  NewSessionResponseModel copyWith({
    int? code,
    String? message,
    List<ICEModel>? iceServers2,
    SDPHeyGenModel? sdp,
    String? sessionId,
  }) {
    return NewSessionResponseModel(
      code: code ?? this.code,
      message: message ?? this.message,
      iceServers2: iceServers2 ?? this.iceServers2,
      sdp: sdp ?? this.sdp,
      sessionId: sessionId ?? this.sessionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': <String, dynamic>{
        'code': code,
        'message': message,
        'ice_servers2': iceServers2.map((x) => x.toMap()).toList(),
        'sdp': sdp?.toMap(),
        'session_id': sessionId,
      },
    };
  }

  String toJson() => json.encode(toMap());

  factory NewSessionResponseModel.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> data = map['data'];

    return NewSessionResponseModel(
      code: data['code'] ?? 0,
      message: data['message'] ?? "",
      iceServers2: data['ice_servers2'] != null && data['ice_servers2'] is List
          ? (data['ice_servers2'] as List)
              .map((e) => ICEModel.fromMap(e))
              .toList()
          : [],
      sessionId: data['session_id'] ?? "",
      sdp: data['sdp'] != null && data['sdp'] is Map<String, dynamic>
          ? SDPHeyGenModel.fromMap(data['sdp'])
          : null,
    );
  }

  factory NewSessionResponseModel.fromJson(String source) =>
      NewSessionResponseModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'NewSessionResponseModel(code: $code, message: $message, iceServers2: $iceServers2, sdp: $sdp, sessionId: $sessionId)';
  }
}
