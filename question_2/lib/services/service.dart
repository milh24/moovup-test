import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:question_2/configs/config.dart';
import 'package:question_2/models/person.dart';

class Service {
  static Future<List<Person>> getAll() async {
    try {
      var response = await Dio().get<List>(
        Config.apiEndpoint,
        options: Options(
          headers: {
            "Authorization": "Bearer ${Config.apiKey}",
          },
        ),
      );
      return response.data?.map((e) => Person.fromJson(e)).toList() ?? [];
    } catch (e, s) {
      Logger().e(e, s);
      return [];
    }
  }
}
