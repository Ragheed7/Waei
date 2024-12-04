import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:waie/core/networking/api_constants.dart'; 
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/data/model/product_models/image_data.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

class ImagesSlider extends StatefulWidget {
  const ImagesSlider({super.key, required this.product});
  final Product product;

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  final CarouselSliderController  _carouselController = CarouselSliderController ();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    // Ensure images is a non-null list
    List<ImageData> images = widget.product.images ?? [];

    return SizedBox(
      height: 380,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            items: images.map((imageData) {
              // Access the imageUrl property
              String? imageUrl = imageData.imageUrl != null
                  ? ApiConsts.serverBaseUrl + imageData.imageUrl!
                  : 'assets/images/Kitchens.jpg'; 

              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: imageUrl.startsWith('http')
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/Kitchens.jpg',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              );
                            },
                          )
                        : Image.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                  );
                },
              );
            }).toList(),
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 350,
              initialPage: 0,
              autoPlay: false,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          // Dots Indicator
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: _current,
              count: images.length,
              effect: ExpandingDotsEffect(
                activeDotColor: ColorsManager.mainGreen,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
