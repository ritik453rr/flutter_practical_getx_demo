import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/api_service/response_model.dart';

/// ApiService class
class ApiService extends GetConnect {
  /// Fetch newspapers data from the API
  Future<ResponseModel> getRequest({
    required String baseUrl,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await get(
        baseUrl,
        query: query,
        headers: headers,
      );

      if (response.status.isOk) {
        debugPrint("Data fetched successfully");
        return ResponseModel(status: true, data: response.body);
      } else {
        debugPrint("Failed to fetch data");
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

// {
//     "email": "eve.holt@reqres.in",
//     "password": "cityslicka"
// }
  /// Post request
  Future<ResponseModel> postRequest({
    required String baseUrl,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    final response = await post(
      baseUrl,
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
