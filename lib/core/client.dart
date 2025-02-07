import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.1.131:8888/api/v1"));

  Future<List<dynamic>> fetchOnboardingPages() async {
<<<<<<< HEAD

      var response = await dio.get('/onboarding/list');
        return response.data as List<dynamic>;
  }

 Future<Map<String,dynamic>> fetchUser(int userId) async {
    var responce=await dio.get("/auth/details/$userId");
    Map<String,dynamic> data=responce.data;
    return data;
 }
=======
    var response = await dio.get('/onboarding/list');
    return response.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> fetchUser(int userId) async {
    var response = await dio.get("/auth/details/$userId");
    Map<String, dynamic> data = response.data;
    print(data.toString());
    return data;
  }

  Future<List<dynamic>> fetchRecipes(int categoryId) async{
    var response = await dio.get("/recipes/list?Category=$categoryId");
    final List<dynamic> data = response.data;
    return data;
  }
>>>>>>> 41bb9d6 (I added profile)
}
