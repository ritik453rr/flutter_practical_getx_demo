import 'package:demo/instagram_clone/common/common_ui.dart';
import 'package:demo/instagram_clone/home/model/story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story/flutter_story.dart';
import 'package:get/get.dart';

class InstagramHomeController extends GetxController {
  var storyController = StoryController();
   var stories = [].obs;

  @override
  void onInit() {
    super.onInit();
    stories.value = getStories(); // Initialize stories
  }

  @override
  void onClose() {
    storyController.dispose();
    super.onClose();
  }

  List<StoryModel> getStories() {
    return List.generate(8, (i) {
      return StoryModel(
        id: i + 1,
        avatar: CommonUi.setPngImage("profile_image"),
        label: Text(
          userLabel(i + 1),
          style: const TextStyle(color: Colors.black),
        ),
        cards: [
          storyCard1(i + 1),
          storyCard2(i + 1),
        ],
      );
    });
  }

  String userLabel(int storyIndex) {
    const labels = [
      "Oliver",
      "Liam",
      "Benjamin",
      "James",
      "Alexander",
      "John",
      "Ava",
      "Emma",
      "Lili"
    ];
    return labels[storyIndex - 1];
  }

  StoryCardModel storyCard1(int i) => StoryCardModel(
        visited: false, // Reactive default value
        color: Colors.purple,
        childOverlay: Container(
          margin: const EdgeInsets.all(50),
          child: const Center(
            child: Text(
              "Lorem Ipsum text here...",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      );

  StoryCardModel storyCard2(int i) => StoryCardModel(
        visited: false,
        child: Container(
          color: Colors.purple,
          child: Column(
            children: [
              // Other widgets as in the original code...
              Center(
                child: Text(
                  "Story $i",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );
}
