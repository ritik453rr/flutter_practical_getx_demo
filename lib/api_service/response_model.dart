class ResponseModel{
  final bool status;
  final String message;
  final dynamic data;

  ResponseModel({this.message='',this.status=false,this.data});

  factory ResponseModel.fromJson(Map<String, dynamic> json){
    return ResponseModel(
       status: json['status'],
        message: json['message'],
        data: json['data']
    );
  }
}