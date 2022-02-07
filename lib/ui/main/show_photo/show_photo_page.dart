import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:get/get.dart';
import 'package:testnew/controller/main/detail_controller.dart';
import 'package:testnew/controller/main/home/home_controller.dart';
import 'package:testnew/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:testnew/core/theme/app_colors.dart';
import 'package:testnew/core/theme/app_text_style.dart';
import 'package:testnew/routes/app_routes.dart';
import 'package:testnew/ui/main/home/widgets/button_widget.dart';

class ShowPhotoPage extends GetView<DetailController> {
  const ShowPhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue50.withOpacity(0.99),
        title: Text('Photos'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.appBarTitle,
      ),
      body: GetBuilder<DetailController>(
        builder: (controller) {
          return SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: controller.isLoading,
              child: Visibility(
                visible: !controller.isLoading,
                child: Flexible(
                  child: GridView.count(
                    crossAxisCount: 2,
                    physics: ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(12),
                    shrinkWrap: true,
                    addAutomaticKeepAlives: false,
                    cacheExtent: 100,
                    crossAxisSpacing: 6,
                    childAspectRatio: 180 / 180,
                    mainAxisSpacing: 5,
                    children: List.generate(
                      controller.myPhotos?.length ?? 0,
                      (index) => Container(
                        child: FullScreenWidget(
                          child: Hero(
                            tag: "customTag",
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(20),
                              child: Center(
                                child: CachedNetworkImage(
                                  imageUrl: controller
                                      .myPhotos?[index].url ??
                                      '',
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
