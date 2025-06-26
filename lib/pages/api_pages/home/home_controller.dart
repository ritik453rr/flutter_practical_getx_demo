import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/api_service/api_endpoint.dart';
import 'package:getx_demo/api_service/api_service.dart';
import 'package:getx_demo/api_service/response_model.dart';
import 'package:getx_demo/models/news_model.dart';

/// HomeController manages the state and business logic for the home page
class HomeController extends GetxController {
  /// Controllers and Instances
  late ApiService apiServiece;
  late ScrollController scrollController;

  // Variables
  var page = 1;
  final RxBool isLoading = true.obs;
  var fetchingMore = false.obs;
  var hasMore = false;

  ///Lists
  var newsList = <Item>[].obs;

  @override
  void onInit() {
    super.onInit();
    initControllersAndInstances();
    addScrollListener();
    fetchNews(isInit: true);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    apiServiece.dispose();
  }

  void initControllersAndInstances() {
    apiServiece = ApiService();
    scrollController = ScrollController();
  }

  /// Add scroll listener to the scroll controller
  void addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 150 &&
          hasMore) {
        fetchMoreNews();
      }
    });
  }

  /// Fetch newspapers data from the API
  Future<void> fetchNews({bool isInit = false}) async {
    page = isInit ? 1 : page + 1;
    var query = {
      'terms': 'oakland',
      'format': 'json',
      'page': "$page",
    };

    final ResponseModel resModel = await apiServiece.getRequest(
      url: ApiEndPoint.newsBaseUrl,
      query: query,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    if (resModel.status) {
      NewsModel newsModel = NewsModel.fromJson(resModel.data);
      if (isInit) {
        newsList.value = newsModel.items;
      } else {
        newsList.addAll(newsModel.items);
      }
      hasMore = newsModel.totalItems > newsList.length;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      Get.snackbar('Error', resModel.message);
    }
  }

  /// Fetch more news from the API
  Future<void> fetchMoreNews() async {
    if (fetchingMore.value) {
      return;
    }
    fetchingMore.value = true;
    await Future.delayed(const Duration(seconds: 5));

    await fetchNews();
    fetchingMore.value = false;
  }
}
