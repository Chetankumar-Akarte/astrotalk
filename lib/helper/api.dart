import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';

import '../models/relatives.dart';
import '../models/quiz.dart';

const String logID = "Network Service Response";
const String baseURL = "staging-api.astrotak.com";
const String quizCategoryPath = "api/question/category/all";
const String relativeAll = "api/relative/all";
const String relativeDelete = "api/relative/delete";
const String relativeUpdate = "api/relative/update";
const String location = "api/location/place";
const String locationParameter = "inputPlace";
const String token =
    "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ";

class Api {
  static late Client client = Client();

  static Map<String, String> get headers => {
        HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        HttpHeaders.authorizationHeader: token,
      };

  static Future<List<Quiz>> getQuestions() async {
    List<Quiz> categories = [];

    Uri url = Uri.https(baseURL, quizCategoryPath);
    Response response = await client.get(url, headers: headers);

    final String? contentType = response.headers[HttpHeaders.contentTypeHeader];
    var body = response.body;

    if (contentType != null &&
        contentType.contains(ContentType.json.toString())) {
      body = utf8.decode(response.bodyBytes);
    }

    Map data = json.decode(body);

    var list = data["data"] as List<dynamic>?;
    try {
      if (list != null) {
        for (var item in list) {
          categories.add(Quiz.fromJson(item));
        }
      }
    } on Exception catch (e, stackTrace) {
      log("Warning: ", error: e, stackTrace: stackTrace, name: logID);
    }

    return categories;
  }

  // Fetch all Friends & Family Profile
  static Future<List<Relatives>> getRelativeProfiles() async {
    List<Relatives> profiles = [];

    Uri url = Uri.https(baseURL, relativeAll);
    Response response = await client.get(url, headers: headers);

    final String? contentType = response.headers[HttpHeaders.contentTypeHeader];
    var body = response.body;

    if (contentType != null &&
        contentType.contains(ContentType.json.toString())) {
      body = utf8.decode(response.bodyBytes);
    }

    Map data = json.decode(body);
    var list = data["data"]?["allRelatives"] as List<dynamic>?;

    try {
      if (list != null) {
        for (var item in list) {
          profiles.add(Relatives.fromJson(item));
        }
      }
    } on Exception catch (e, stackTrace) {
      log("Warning: ", error: e, stackTrace: stackTrace, name: logID);
    }

    return profiles;
  }

  // Delete Friends & Family Profile
  static Future<bool> deleteMember(String id) async {
    Uri url = Uri.https(baseURL, "$relativeDelete/$id");

    Response response = await client.post(url, headers: headers);

    final String? contentType = response.headers[HttpHeaders.contentTypeHeader];
    var body = response.body;

    if (contentType != null &&
        contentType.contains(ContentType.json.toString())) {
      body = utf8.decode(response.bodyBytes);
    }

    Map data = json.decode(body);
    var result = data["success"] as bool?;

    try {
      if (result != null) {
        return result;
      } else {
        return false;
      }
    } on Exception catch (e, stackTrace) {
      log("Warning: ", error: e, stackTrace: stackTrace, name: logID);
      return false;
    }
  }

  // save Friends & Family Profile
  static Future<String> saveMember(Map<String, dynamic> payload) async {
    Uri url = Uri.https(baseURL, relativeUpdate);
        Response response = await client.post(url, headers: headers, body: json.encode(payload));

    final String? contentType = response.headers[HttpHeaders.contentTypeHeader];
    var body = response.body;

    if(contentType != null && contentType.contains(ContentType.json.toString())) {
      body = utf8.decode(response.bodyBytes);
    }

    Map data = json.decode(body);

    log("Info: " + json.encode(data) , name: logID);

    return data["message"];
  }

  // place id by place name
  static Future<List<Map<String, dynamic>>> getPlaceId(String placeName) async {
    List<Map<String, dynamic>> places = [];
    Map<String, dynamic> query = {locationParameter : placeName};
    Uri url = Uri.https(baseURL, location, query);
    Response response = await client.get(url, headers: headers);

    final String? contentType = response.headers[HttpHeaders.contentTypeHeader];
    var body = response.body;

    if(contentType != null && contentType.contains(ContentType.json.toString())) {
      body = utf8.decode(response.bodyBytes);
    }

    Map data = json.decode(body);

    var list = data["data"] as List<dynamic>? ;

    try {
      if (list != null) {
        for(var item in list) {
          places.add(item);
        }
      }
    } on Exception catch (e, stackTrace) {
      log("Warning: ", error: e, stackTrace: stackTrace, name: logID);
    }

    log("Info: " + json.encode(data) , name: logID);

    return places;
  }
}
