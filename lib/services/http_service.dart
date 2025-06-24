import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HttpService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;

  HttpService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
  }

  Future<Response?> get(String _path) async {
    try {
      String _url = "$_base_url$_path";
      Response response = await dio.get(_url);
      return response;
    } catch (e) {
      print("HttpService: Unable to perform Get request");
      print(e);
    }
  }
}
