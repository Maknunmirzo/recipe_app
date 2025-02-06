import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.1.131:8888/api/v1"));

  Future<List<dynamic>> fetchOnboardingPages() async {

      var response = await dio.get('/onboarding/list');
        return response.data as List<dynamic>;
  }

 Future<Map<String,dynamic>> fetchUser(int userId) async {
    var responce=await dio.get("/auth/details/$userId");
    Map<String,dynamic> data=responce.data;
    return data;
 }
}
