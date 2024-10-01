import 'dart:convert';

import 'package:hey_gen/models/index.dart';

class SubmitICERequestModel {
  final String sessionId;
  final CandidateHeygenModel candidate;
  SubmitICERequestModel({
    required this.sessionId,
    required this.candidate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'session_id': sessionId,
      'candidate': candidate.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'SubmitICERequestModel(sessionId: $sessionId, candidate: $candidate)';
}
