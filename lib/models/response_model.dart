import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel{
  final String message;
  final bool status;
  final dynamic data;

  ResponseModel({this.message='',this.status=false,this.data});

  factory ResponseModel.fromJson(Map<String, dynamic> json){
    return ResponseModel(
        message: json['message'] ??"",
        status: json['status'] ?? "",
        data: json['data'] ?? ""
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data
  };
}