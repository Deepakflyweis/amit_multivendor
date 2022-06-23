import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

// const String serverBaseUrl = "https://amit-ray-1234.herokuapp.com/api/v1/";
// const String serverBaseUrl = "http://mern.online:4001/api/v1/";

class Client {
  static String token = "token";
  static String resettoken = "";

  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptors());
    _dio.options.baseUrl = "http://mern.online:4001/api/v1/";
    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    GetStorage box = GetStorage();
    var token = await box.read("token");
    if (token != null) {
      options.headers["Authorization"] = "Bearer " + token;
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}
