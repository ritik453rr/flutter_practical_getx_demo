import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/api_service/api_models/response_model.dart';

/// ApiService class to handle API requests using GetConnect
class ApiService extends GetConnect {
  /// Sends a GET request to server.
  Future<ResponseModel> getRequest({
    required String url,
    dynamic model,
  }) async {
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ",
    };
    try {
      final response = await get(
        url,
        headers: headers,
      );

      if (response.status.isOk) {
        return ResponseModel(
            status: true, data: model(jsonEncode(response.body)));
      } else {
        return ResponseModel(status: false, message: "Failed to fetch data");
      }
    } catch (e) {
      debugPrint('Error: $e');
      return ResponseModel(
          status: false, message: "Error: Something went wrong");
    }
  }



  /// Sends a POST request to the Server.
  Future<ResponseModel> postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    final headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "x-api-key": "reqres-free-v1",
    };
    final response = await post(
      url,
      headers: headers,
      body,
    );
    try {
      if (response.status.isOk) {
        return ResponseModel(status: true, data: response.body);
      } else {
        return ResponseModel(status: false, message: "Failed to fetch data");
      }
    } catch (e) {
      debugPrint('Error: $e');
      return ResponseModel(
          status: false, message: "Error: Something went wrong");
    }
  }
}

// Add this header to your API requests:
// x-api-key: reqres-free-v1
//  "email": "eve.holt@reqres.in",
//  "password": "cityslicka"
