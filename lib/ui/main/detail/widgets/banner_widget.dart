import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:get/get.dart';
import 'package:testnew/controller/main/detail_controller.dart';
import 'package:testnew/controller/main/home/home_controller.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = (Get.width - 44) / 3;
    return GetBuilder<DetailController>(
      builder: (controller) => Container(
        height: width * 88 / 112,
        margin: EdgeInsets.only(left: 12, top: 12),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: controller.myPhotos?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FullScreenWidget(
                child: Hero(
                  tag: "customTag",
                  child: CachedNetworkImage(
                    imageUrl: controller
                        .myPhotos?[index].url ??
                        'https://via.placeholder.com/150/f66b97',
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
