import 'package:dio/dio.dart';
import 'package:social/core/network/local/cashe_helper.dart';

class DioHelper {
  static final dio = Dio(
    BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
    ),
  );

  static void initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          var token = CacheHelper.getString(key: "Token");
          var headers = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': token != null ? 'Bearer $token' : "",
          };
          print("request => ${request}");
          request.headers.addAll(headers);
          return handler.next(request); //continue
        },
        onResponse: (response, handler) {
          print("response => ${response}");

          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          print("response => ${e}");
          return handler.next(e); //continue
        },
      ),
    );
  }
}
