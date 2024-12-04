import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OrderImagesListScreen extends StatelessWidget {
  final List<String?> imageList;

  OrderImagesListScreen({required this.imageList});

  @override
  Widget build(BuildContext context) {
    if (imageList.isEmpty) {
      return Text("No images available.");
    }

    return Container(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageList[index] ?? "assets/images/waie2.png",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: Icon(Icons.image, color: Colors.grey),
              ),
              errorWidget: (context, url, error) => Image.asset(
                "assets/images/waie2.png",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
