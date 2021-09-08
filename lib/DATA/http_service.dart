import 'package:dio/dio.dart';

class HttpService {
  Dio _dio = Dio();

  HttpService() {
    // initInterceptors();
  }
  // initInterceptors() {
  //   _dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
  //     print(error.message);
  //   }, onRequest: (request, handler) {
  //     print(
  //         'request method = ${request.method}, path = ${request.path}, request.data = ${request.data}\n');
  //   }, onResponse: (response, handler) {
  //     print('data = ${response.data}');
  //   }));
  // }

  //not working for web, only android and should work on ios
//TODO: add alternative for web (or fix Drio options to work for web)
  Future<Response?> get(String url) async {
    Response response = Response(
        requestOptions: RequestOptions(
            path: url, contentType: "application/json;charset=UTF-8"));
    try {
      response = await _dio.get(url);
      print('response = ${response}');
      return response;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error.response;
    }
  }

  Future getAllCars() {
    return get('http://amlht.com/api/Vehicles');
  }

  Future getCarRecords(String vehCode) {
    return get('http://amlht.com/api/vget/$vehCode');
  }
}
