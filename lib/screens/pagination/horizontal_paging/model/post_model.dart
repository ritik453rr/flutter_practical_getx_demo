class PostModel {
  final String title;
  final String body;

  PostModel.fromJson(Map<String, dynamic> obj)
      : title = obj['title'] ?? '',
        body = obj['body'] ?? '';

  static List<PostModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map<PostModel>((obj) => PostModel.fromJson(obj)).toList();
  }
}