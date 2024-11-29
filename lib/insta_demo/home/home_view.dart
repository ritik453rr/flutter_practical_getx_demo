import 'package:demo/common/app_colors.dart';
import 'package:demo/common/common_ui.dart';
import 'package:demo/insta_demo/home/home_controller.dart';
import 'package:demo/insta_demo/home/model/story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story/flutter_story.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[700],
              border:const Border(
                bottom: BorderSide(
                  color: AppColors.deepBlack,
                  width: 0.5,
                ),
              ),
            ),
          ),
          Story.builder(
            controller: homeController.storyController,
            itemCount: homeController.stories.length,
            itemBuilder: (context, index) {
              StoryModel s = homeController.stories[index];
              return StoryUser(
                avatar: s.avatar,
                label: s.label,
                children: s.cards == null
                    ? []
                    : s.cards!
                        .map(
                          (card) => StoryCard(
                            visited: card.visited,
                            onVisited: (Index) {
                              card.visited = true;
                            },
                          ),
                        )
                        .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
