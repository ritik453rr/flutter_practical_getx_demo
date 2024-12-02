import 'package:demo/instagram_clone/common/app_colors.dart';
import 'package:demo/instagram_clone/common/instagram_keys.dart';
import 'package:demo/instagram_clone/common/common_ui.dart';
import 'package:demo/instagram_clone/common/custom_app_bar.dart';
import 'package:demo/instagram_clone/home/instagram_home_controller.dart';
import 'package:demo/instagram_clone/home/model/story_model.dart';
import 'package:demo/instagram_clone/instagram_routing/instagram_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story/flutter_story.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InstagramHomeView extends StatelessWidget {
  InstagramHomeView({super.key});

  final InstagramHomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customWhite,
      appBar: CustomAppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: CommonUi.setSvgImage("camera_icon", height: 22, width: 24),
        ),
        title: CommonUi.setPngImage("instagram_text",  width: 110),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                Get.offAllNamed(InstagramRoutes.instagramLogin);
                GetStorage().write(InstagramKeys.isLogged, false);
              },
              child: CommonUi.setSvgImage("igtv_notification_icon")),
          const SizedBox(
            width: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CommonUi.setSvgImage("messanger_icon"),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Story.builder(
              controller: homeController.storyController,
              itemCount: homeController.stories.length,
              itemBuilder: (context, index) {
                StoryModel s = homeController.stories[index];
                return StoryUser(
                  avatar: s.avatar,
                  label: s.label,
                  height: 75,
                  width: 75,
                  children: s.cards == null
                      ? []
                      : s.cards!
                          .map(
                            (card) => StoryCard(
                              visited: card.visited,
                              onVisited: (index) {
                                card.visited = true;
                                homeController.stories.refresh();
                              },
                            ),
                          )
                          .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
