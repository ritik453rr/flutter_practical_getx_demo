import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_colors.dart';
import 'package:getx_demo/common/images.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int selectedAge = 4;
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: Column(
        children: [
          Container(
            height: 80,
            width: Get.width,
            color: AppColors.deepPurple,
          ),
          Stack(
            children: [
              Container(
                height: 60,
                width: Get.width,
                color: AppColors.deepPurple,
              ),
              Image.asset(
                ImgRes.wave,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: 10,
              itemBuilder: (context, index, _) {
                int age = index + 1;
                bool isSelected = age == selectedAge;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAge = index + 1;
                    });
                    carouselController.animateToPage(index);
                  },
                  child: Container(
                    alignment: Alignment.center,

                    margin: const EdgeInsets.symmetric(
                        horizontal: 4), // Adjust spacing
                    decoration: BoxDecoration(
                      color: AppColors.darkPurple,
                      borderRadius: BorderRadius.circular(12),
                      border: isSelected
                          ? Border.all(color: AppColors.softPurple)
                          : null,
                    ),
                    child: Text(
                      '$age',
                      style: TextStyle(
                        fontSize: isSelected ? 30 : 25,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color:
                            isSelected ? AppColors.white : AppColors.mediumGray,
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                initialPage: selectedAge - 1,

                height: 100, // Adjust to fit the items comfortably
                enlargeCenterPage: true,
                viewportFraction:
                    0.18, // Shows adjacent items on the left and right
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedAge = index + 1;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
