import 'dart:convert';

import 'package:hey_gen/models/sdp_heygen_model.dart';

class StartSessionResquestModel {
  final SDPHeyGenModel sdp;
  final String sessionId;
  StartSessionResquestModel({
    required this.sdp,
    required this.sessionId,
  });

  StartSessionResquestModel copyWith({
    SDPHeyGenModel? sdp,
    String? sessionId,
  }) {
    return StartSessionResquestModel(
      sdp: sdp ?? this.sdp,
      sessionId: sessionId ?? this.sessionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sdp': sdp.toMap(),
      'session_id': sessionId,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'StartSessionResquestModel(sdp: $sdp, sessionId: $sessionId)';
}
