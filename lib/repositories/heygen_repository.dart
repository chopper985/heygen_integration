import 'package:dio/dio.dart';
import 'package:hey_gen/constants/constants.dart';
import 'package:hey_gen/constants/endpoints.dart';
import 'package:hey_gen/hey_gen.dart';
import 'package:hey_gen/models/index.dart';
import 'package:hey_gen/repositories/heygen_repository_interface.dart';

class HeygenRepository extends HeygenRepositoryInterface {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      sendTimeout: timeout,
    ),
  );

  Options get options =>
      Options(validateStatus: (status) => true, headers: headers);

  Map<String, String> get headers {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'X-Api-Key': HeyGenAPI().heygenAPIKey,
    };
  }

  @override
  Future<NewSessionResponseModel?> getSessionHeyGen(
    NewSessionRequestModel requestBody,
  ) async {
    final Response response = await _dio.post(
      Endpoints.newSession,
      data: requestBody.toMap(),
      options: options,
    );

    if (response.statusCode == 200) {
      return NewSessionResponseModel.fromJson(response.data);
    }

    return null;
  }

  @override
  Future<String?> createSessionToken() async {
    final Response response = await _dio.post(
      Endpoints.createToken,
      options: options,
    );

    if (response.statusCode == 200) return response.data['data']?['token'];

    return null;
  }

  @override
  Future<bool> startSessionHeyGen(
    StartSessionResquestModel requestBody,
  ) async {
    final Response response = await _dio.post(
      Endpoints.startSession,
      data: requestBody.toMap(),
      options: options,
    );

    return response.statusCode == 200;
  }

  @override
  Future<bool> submitICEHeyGen(SubmitICERequestModel requestBody) async {
    final Response response = await _dio.post(
      Endpoints.submitICE,
      data: requestBody.toMap(),
      options: options,
    );

    return response.statusCode == 200;
  }

  @override
  Future<bool> stopSessionHeyGen(String sessionId) async {
    final Response response = await _dio.post(
      Endpoints.stopSession,
      data: {"session_id": sessionId},
      options: options,
    );

    return response.statusCode == 200;
  }

  @override
  Future<bool> interruptSessionHeyGen(String sessionId) async {
    final Response response = await _dio.post(
      Endpoints.interruptTask,
      data: {"session_id": sessionId},
      options: options,
    );

    return response.statusCode == 200;
  }

  @override
  Future<bool> speakWithHeyGen(
    String sessionId,
    String text,
    TaskMode taskMode,
    TaskType taskType,
  ) async {
    final Response response = await _dio.post(
      Endpoints.sendTask,
      data: {
        "session_id": sessionId,
        "text": text,
        "task_mode": taskMode.mode,
        "task_type": taskType.type,
      },
      options: options,
    );

    return response.statusCode == 200;
  }
}
