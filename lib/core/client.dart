import 'dart:core';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/core/Exceptions/auth_exception.dart';
import 'package:recipe_app/core/interceptor.dart';
import 'package:recipe_app/core/secure_storage.dart';
import 'package:recipe_app/features/auth/data/models/sign_up_user_model.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: "http://192.168.30.182:8888/api/v1"));
    dio.interceptors.add(AuthInterceptor());
  }

  late final Dio dio;

  Future<String> login(
      {required String login, required String password}) async {
    var response = await dio.post(
      "/auth/login",
      data: {"login": login, "password": password},
    );
    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      return data["accessToken"]!.toString();
    } else {
      throw AuthException();
    }
  }

  Future<Map<String, dynamic>> signUp({required SignUpUserModel user}) async {
    var responce = await dio.post("/auth/register", data: user.toJson());
    if (responce.statusCode == 201) {
      String token = responce.data["accessToken"];
      return {
        "result": true,
        "token": token,
      };
    } else {
      return {
        "result": true,
        "token": null,
      };
    }
  }

  Future<List<dynamic>> fetchOnboardingPages() async {
    var response = await dio.get('/onboarding/list');
    return response.data as List<dynamic>;
  }

  Future<Map<String, dynamic>> fetchChefProfileById(int userId) async {
    var responce = await dio.get("/auth/details/$userId");
    Map<String, dynamic> data = responce.data;
    return data;
  }

  Future<List<dynamic>> fetchRecipesByUserId(int userId) async {
    var response = await dio.get("/recipes/list?UserId=$userId");
    List<dynamic> data = response.data;
    return data;
  }

  Future<dynamic> fetchMyProfile() async {
    var response = await dio.get("/auth/me");
    return response.data;
  }

  Future<List<dynamic>> fetchMyRecipes([int? limit]) async {
    var response = await dio.get("/recipes/my-recipes?Limit=$limit");
    List<dynamic> data = response.data;
    return data;
  }
  
  Future<List<dynamic>> fetchHomeChefs([int? limit])async {
    var response=await dio.get("/auth/top-chefs?Limit=$limit");
    List<dynamic> data=response.data;
    return data;
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get("/categories/list");
    List<dynamic> data = response.data;
    return data;
  }

  Future<dynamic> fetchRecipeById(int recipeId) async {
    var response = await dio.get("/recipes/detail/$recipeId");
    return response.data;
  }

  Future<dynamic> fetchTrendingRecipe() async {
    var response = await dio.get("/recipes/trending-recipe");
    return response.data;
  }

  Future<List<dynamic>> fetchRecipesByCategoryId(int categoryId) async {
    var response = await dio.get("/recipes/list?Category=$categoryId");
    final List<dynamic> data = response.data;
    return data;
  }
}
