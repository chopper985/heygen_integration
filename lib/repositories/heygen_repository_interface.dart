import 'package:hey_gen/models/index.dart';

abstract class HeygenRepositoryInterface {
  Future<String?> createSessionToken();
  Future<NewSessionResponseModel?> getSessionHeyGen(
    NewSessionRequestModel requestBody,
  );
  Future<bool> startSessionHeyGen(StartSessionResquestModel requestBody);
  Future<bool> submitICEHeyGen(SubmitICERequestModel requestBody);
  Future<bool> interruptSessionHeyGen(String sessionId);
  Future<bool> speakWithHeyGen(
    String sessionId,
    String text,
    String taskMode,
    String taskType,
  );
  Future<bool> stopSessionHeyGen(String sessionId);
}
