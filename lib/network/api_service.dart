import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getx_demo/network/model/response_model.dart';
import 'package:path_provider/path_provider.dart';

/// A Singleton service class that handles API requests using Dio.
class ApiService {
  // ---- Singleton Setup ----
  ApiService._internal(); // Private constructor
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance; // Public factory -> always same instance

  // ---- Single Dio Instance ----
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );

  // ---- GET Request ----
  Future<ResponseModel> getRequest({
    required String url,
  }) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return ResponseModel(status: true, data: response.data);
      } else {
        return ResponseModel(
          status: false,
          message: "Failed to fetch data",
        );
      }
    } catch (e) {
      debugPrint("GET Error: $e");
      return ResponseModel(
        status: false,
        message: "Something went wrong",
      );
    }
  }

  /// Downloads a media file from the given URL and saves it to device storage.
  Future<ResponseModel> downloadMedia({
    required String url,
    required String dirPath,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final fileName = url.split('/').last;
      final filePath = "$dirPath/$fileName";
      await dio.download(
        url,
        filePath,
        onReceiveProgress: onReceiveProgress,
      );
      return ResponseModel(
        status: true,
        message: "File saved to: $filePath",
      );
    } catch (e) {
      return ResponseModel(
        status: false,
        message: "Something went wrong",
      );
    }
  }


}
