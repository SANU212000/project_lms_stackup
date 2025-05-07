import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lms_project/screen/home_page/contoller/carousel_slider_controller.dart';
import 'package:lms_project/helpers/app_colour.dart';

class InnerBannerSlider extends ConsumerWidget {
  const InnerBannerSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(finalViewControllerProvider.notifier);
    final state = ref.watch(finalViewControllerProvider);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.black,
          ),
          height: 200,
          width: MediaQuery.of(context).size.width,

          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: CarouselSlider(
                  carouselController: controller.innerCarouselController,
                  options: CarouselOptions(
                    disableCenter: true,
                    padEnds: false,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                    onPageChanged:
                        (index, reason) => controller.updateInnerPage(index),
                  ),
                  items:
                      AppData.innerStyleImages
                          .map<Widget>(
                            (imagePath) => CustomImageViewer.show(
                              context: context,
                              url: imagePath,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                          .toList(),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .02,
                left: 10,
                child: Row(
                  children: List.generate(AppData.innerStyleImages.length, (
                    index,
                  ) {
                    bool isSelected = state.innerCurrentPage == index;
                    return GestureDetector(
                      onTap: () => controller.animateToInnerPage(index),
                      child: AnimatedContainer(
                        width: isSelected ? 100 : 30,
                        height: 5,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? AppColors.blazingOrange
                                  : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      ),
                      
                    );
                    
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AppData {
  AppData._();

  static final List<String> innerStyleImages = [
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/clothing-store-banner-design-template-e7332aaf6402c88cb4623bf8eb6f97e2_screen.jpg?ts=1620867237',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-fashion-sale-banner-template-design-cc34c2027d0bb5ccc2ff90231abaa242_screen.jpg?ts=1613395464',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-store-facebook-ad-banner-design-template-754121190affdca4b258b77da2984528_screen.jpg?ts=1655421066',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/clothing-store-banner-design-template-e7332aaf6402c88cb4623bf8eb6f97e2_screen.jpg?ts=1620867237',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-fashion-sale-banner-template-design-cc34c2027d0bb5ccc2ff90231abaa242_screen.jpg?ts=1613395464',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-store-facebook-ad-banner-design-template-754121190affdca4b258b77da2984528_screen.jpg?ts=1655421066',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/clothing-store-banner-design-template-e7332aaf6402c88cb4623bf8eb6f97e2_screen.jpg?ts=1620867237',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-fashion-sale-banner-template-design-cc34c2027d0bb5ccc2ff90231abaa242_screen.jpg?ts=1613395464',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-store-facebook-ad-banner-design-template-754121190affdca4b258b77da2984528_screen.jpg?ts=1655421066',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/clothing-store-banner-design-template-e7332aaf6402c88cb4623bf8eb6f97e2_screen.jpg?ts=1620867237',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-fashion-sale-banner-template-design-cc34c2027d0bb5ccc2ff90231abaa242_screen.jpg?ts=1613395464',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-store-facebook-ad-banner-design-template-754121190affdca4b258b77da2984528_screen.jpg?ts=1655421066',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/clothing-store-banner-design-template-e7332aaf6402c88cb4623bf8eb6f97e2_screen.jpg?ts=1620867237',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-fashion-sale-banner-template-design-cc34c2027d0bb5ccc2ff90231abaa242_screen.jpg?ts=1613395464',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-store-facebook-ad-banner-design-template-754121190affdca4b258b77da2984528_screen.jpg?ts=1655421066',
  ];
}

class CustomImageViewer {
  CustomImageViewer._();

  static show({
    required BuildContext context,
    required String url,
    BoxFit? fit,
    double? radius,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit ?? BoxFit.cover,
      imageBuilder:
          (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 10),
              image: DecorationImage(
                image: imageProvider,
                fit: fit ?? BoxFit.fill,
              ),
            ),
          ),
      placeholder: (context, url) => Container(),
      errorWidget: (context, url, error) => const Icon(Icons.error_outline),
    );
  }
}
