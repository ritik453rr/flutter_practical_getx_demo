class ResponseModel {
  bool status;
  String message;
  dynamic data;

  ResponseModel({this.status = false, this.message = "", this.data = ""});
}
