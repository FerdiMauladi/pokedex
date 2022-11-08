import 'package:dio/dio.dart';
import 'package:pokedex/const/app_const.dart';

class NetworkCore {
  Dio dio = Dio();

  NetworkCore() {
    dio.options = BaseOptions(
        baseUrl: AppConstant.baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        sendTimeout: 30000,
        headers: {
          "Accept": "application/json"
        }
    );
  }
}