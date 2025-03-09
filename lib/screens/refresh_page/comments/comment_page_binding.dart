import 'package:get/get.dart';
import 'package:getx_demo/screens/refresh_page/comments/comment_page_controller.dart';

class CommentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentPageController>(() => CommentPageController());
  }
}
