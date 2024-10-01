import 'dart:convert';

class CandidateHeygenModel {
  final String candidate;
  final String sdpMid;
  final int sdpMLineIndex;
  final String usernameFragment;
  CandidateHeygenModel({
    required this.candidate,
    required this.sdpMid,
    required this.sdpMLineIndex,
    required this.usernameFragment,
  });

  CandidateHeygenModel copyWith({
    String? candidate,
    String? sdpMid,
    int? sdpMLineIndex,
    String? usernameFragment,
  }) {
    return CandidateHeygenModel(
      candidate: candidate ?? this.candidate,
      sdpMid: sdpMid ?? this.sdpMid,
      sdpMLineIndex: sdpMLineIndex ?? this.sdpMLineIndex,
      usernameFragment: usernameFragment ?? this.usernameFragment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'candidate': candidate,
      'sdpMid': sdpMid,
      'sdpMLineIndex': sdpMLineIndex,
      'usernameFragment': usernameFragment,
    };
  }

  factory CandidateHeygenModel.fromMap(Map<String, dynamic> map) {
    return CandidateHeygenModel(
      candidate: map['candidate'] ?? "",
      sdpMid: map['sdpMid'] ?? "",
      sdpMLineIndex: map['sdpMLineIndex'] ?? 0,
      usernameFragment: map['usernameFragment'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory CandidateHeygenModel.fromJson(String source) =>
      CandidateHeygenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CandidateHeygenModel(candidate: $candidate, sdpMid: $sdpMid, sdpMLineIndex: $sdpMLineIndex, usernameFragment: $usernameFragment)';
  }
}
