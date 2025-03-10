import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/api_service/api_endpoint.dart';
import 'package:getx_demo/api_service/response_model.dart';

/// ApiService class
class ApiService extends GetConnect {
  @override
  String? get baseUrl => ApiEndPoint.baseUrl;

/// getRequest method
  Future<ResponseModel> getRequest({
    required String endPoint,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await get(endPoint, headers: headers);
    try {
      if (response.statusCode == 200) {
        return ResponseModel(status: true, data: response);
      } else {
        debugPrint("Status Code: ${response.statusCode}");
        return ResponseModel(message: "Something went wrong");
      }
    } catch (e) {
      debugPrint("Error: $e");
      return ResponseModel(message: "Something went wrong");
    }
  }
}
