library hey_gen;

import 'package:hey_gen/models/index.dart';
import 'package:hey_gen/repositories/heygen_repository.dart';

class HeyGenAPI {
  String heygenAPIKey = "";

  void initialize({required String heygenAPIKey}) {
    heygenAPIKey = heygenAPIKey;
  }

  Future<NewSessionResponseModel?> getSessionHeyGen(
    NewSessionRequestModel requestBody,
  ) async {
    final NewSessionResponseModel? response =
        await HeygenRepository().getSessionHeyGen(requestBody);

    return response;
  }

  Future<bool> startSessionHeyGen(
    StartSessionResquestModel requestBody,
  ) async {
    final bool status =
        await HeygenRepository().startSessionHeyGen(requestBody);

    return status;
  }

  Future<bool> submitICEHeyGen(SubmitICERequestModel requestBody) async {
    final bool status = await HeygenRepository().submitICEHeyGen(requestBody);

    return status;
  }

  Future<bool> stopSessionHeyGen(String sessionId) async {
    final bool status = await HeygenRepository().stopSessionHeyGen(sessionId);

    return status;
  }

  Future<String?> createSessionToken() async {
    final String? token = await HeygenRepository().createSessionToken();

    return token;
  }

  Future<bool> speakWithHeyGen({
    required String sessionId,
    required String text,
    required TaskType type,
    TaskMode mode = TaskMode.sync,
  }) async {
    final bool status =
        await HeygenRepository().speakWithHeyGen(sessionId, text, mode, type);

    return status;
  }

  Future<bool> interruptSessionHeyGen({
    required String sessionId,
    required String text,
    required TaskType type,
    TaskMode mode = TaskMode.sync,
  }) async {
    final bool status =
        await HeygenRepository().interruptSessionHeyGen(sessionId);

    return status;
  }

  /// Singleton factory
  static final HeyGenAPI instance = HeyGenAPI._internal();

  factory HeyGenAPI() {
    return instance;
  }

  HeyGenAPI._internal();
}
