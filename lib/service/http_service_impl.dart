import 'package:dio/dio.dart';
import 'package:news_app/service/http_service.dart';

const BASE_URL = 'https://newsapi.org/';
const API_KEY = 'b53ab6d6cd534bb0b5de2bac3550d529';

class HttpServiceImpl implements HttpService{

  Dio _dio;

  @override
  Future<Response> getRequest(String url) async{
    // throw UnimplementedError();

    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e){
        print(e.message);
      },
      onRequest: (request){
        print('${request.method} | ${request.path}');
      },
      onResponse: (response){
        print('${response.statusCode} | ${response.statusMessage} | ${response.data}');
      }
    ));
  }

  @override
  void init() {

    _dio = Dio(
      BaseOptions(baseUrl: BASE_URL, headers: {"Autharization": "Bearer $API_KEY"}
      )
    );

    initializeInterceptors();

  }

}