import 'dart:convert';

import 'package:dio/dio.dart';

class UserServices {
  final Dio _dio = Dio();
  
  Future<List<T>> fetchData<T>(String url,T Function(Map<String, dynamic>) fromJson,) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final body = response.data;
        if (body is List) {
          return body.map<T>((item) => fromJson(Map<String, dynamic>.from(item))).toList();
        } else if (body is Map<String, dynamic>) {
          return [fromJson(body)];
        } else {
          throw Exception("Unexpected JSON format");
        }
      } else {
        throw Exception("❌ Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("⚠️ Exception: $e");
    }
  }

Future<Response> postData<T>({required String url,required dynamic body, Map<String, dynamic> Function(T)? toJson, Map<String, dynamic>? headers,}) async {
  try {
    dynamic payload;
      if (toJson != null && body is T) {
        payload = toJson(body);
      } 
      else if (body is Map<String, dynamic> || body is List) {
        payload = body;
      } 
      else {
        payload = body;
      }
      final response = await _dio.post(
        url,
        data: payload,
        options: Options(
          headers: headers,
          contentType: Headers.jsonContentType,
        ),
      );
      return response;
    } catch (e) {
      throw Exception("⚠️ POST failed: $e");
    }
  }

  Future<Response> updateData<T>({required String url,required dynamic body, Map<String, dynamic> Function(T)? toJson,Map<String, dynamic>? headers,bool usePatch = false, }) async {
    try {
      dynamic payload;
      if (toJson != null && body is T) {
        payload = toJson(body);
      } else if (body is Map<String, dynamic> || body is List) {
        payload = body;
      } else {
        payload = body;
      }
      final response = await (usePatch
        ? _dio.patch(
          url,
          data: payload,
          options: Options(headers: headers, contentType: Headers.jsonContentType),
        ): _dio.put(
          url,
          data: payload,
          options: Options(headers: headers, contentType: Headers.jsonContentType),
        ));
      return response;
    } catch (e) {
      throw Exception("⚠️ UPDATE failed: $e");
    }
  }

  Future<Response> deleteData({required String url,dynamic body, Map<String, dynamic>? headers,}) async {
    try {
      final response = await _dio.delete(
        url,
        data: body, 
        options: Options(headers: headers, contentType: Headers.jsonContentType),
      );
      return response;
    } catch (e) {
      throw Exception("⚠️ DELETE failed: $e");
    }
  }
}


//!------------- usage-----------!
//..............fetch............
// final posts = await api.fetchData<Post>(
//     "https://jsonplaceholder.typicode.com/posts/1",
//     (json) => Post.fromJson(json),
//   );

//   print("Single Post:");
//   print(posts.first);  
//}

// final posts = await api.fetchData<Post>(
//     "https://jsonplaceholder.typicode.com/posts",
//     (json) => Post.fromJson(json),
//   );

//   print("Posts List:");
//   for (var post in posts.take(3)) {
//     print(post);  
//   }

//..........post.........
//__________plain_________
// await api.postData(
//   url: "https://jsonplaceholder.typicode.com/posts",
//   body: {"title": "foo", "body": "bar"},
// );

//_________list/array_______
// await api.postData(
//   url: "https://example.com/bulk",
//   body: [
//     {"id": 1, "name": "Alice"},
//     {"id": 2, "name": "Bob"},
//   ],
// );

//________with custom hearders_________
// await api.postData(
//   url: "https://example.com/protected",
//   body: {"key": "value"},
//   headers: {"Authorization": "Bearer TOKEN123"},
// );

//............put...........
// final response = await api.updateData<User>(
//   url: "https://jsonplaceholder.typicode.com/users/1",
//   model: User(id: 1, name: "Updated Name"),
//   toJson: (u) => u.toJson(),
// );

// print("✅ Updated: ${response.data}");

//...........patch...........
// final response = await api.updateData<User>(
//   url: "https://jsonplaceholder.typicode.com/users/1",
//   model: User(id: 1, name: "Patched Name"),
//   toJson: (u) => u.toJson(),
//   usePatch: true,
// );

//............_____delete by id_____.........
// await api.deleteData(
//   url: "https://jsonplaceholder.typicode.com/users/1",
//   body: {"id": 1},
// );

//.......____delete by custom payload____...........
// await api.deleteData(
//   url: "https://example.com/remove",
//   body: {"username": "alice123", "force": true},
//   headers: {"Authorization": "Bearer tokenXYZ"},
// );
