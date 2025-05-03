import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/api_service/response_model.dart';

/// ApiService class to handle API requests using GetConnect
class ApiService extends GetConnect {
  /// Sends a GET request to the specified [url] with optional [query] and [headers]
  Future<ResponseModel> getRequest({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await get(
        url,
        query: query,
        headers: headers,
      );

      if (response.status.isOk) {
        debugPrint("Data fetched successfully");
        return ResponseModel(status: true, data: response.body);
      } else {
        debugPrint("Failed to fetch data, StatusCode: ${response.statusCode}");
        return ResponseModel(status: false, message: "Failed to fetch data");
      }
    } catch (e) {
      debugPrint('Error: $e');
      return ResponseModel(
          status: false, message: "Error: Something went wrong");
    }
  }

// Add this header to your API requests:
// x-api-key: reqres-free-v1
//  "email": "eve.holt@reqres.in",
//  "password": "cityslicka"
  /// Sends a POST request to the specified [url] with [headers] and [body]
  Future<ResponseModel> postRequest({
    required String url,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final response = await post(
      url,
      headers: headers,
      body,
    );
    try {
      if (response.status.isOk) {
        debugPrint("Post request success");
        return ResponseModel(status: true, data: response.body);
      } else {
        debugPrint("Post request failed, StatusCode: ${response.statusCode}");
        return ResponseModel(status: false, message: "Failed to fetch data");
      }
    } catch (e) {
      debugPrint('Error: $e');
      return ResponseModel(
          status: false, message: "Error: Something went wrong");
    }
  }
}
