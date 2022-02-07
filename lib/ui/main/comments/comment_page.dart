import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testnew/controller/main/comment_controller.dart';
import 'package:testnew/controller/main/detail_controller.dart';
import 'package:testnew/controller/main/home/home_controller.dart';
import 'package:testnew/core/custom_widgets/custom_button/custom_button.dart';
import 'package:testnew/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:testnew/core/theme/app_colors.dart';
import 'package:testnew/core/theme/app_text_style.dart';
import 'package:testnew/data/data_source/local_source.dart';
import 'package:testnew/data/models/comment_response.dart';
import 'package:testnew/data/models/user_response.dart';
import 'package:testnew/ui/main/comments/widgets/custom_circle_text_field.dart';
import 'package:testnew/ui/main/detail/widgets/card_items_widget.dart';
import 'package:testnew/ui/main/home/widgets/button_widget.dart';

class CommentPage extends GetView<CommentController> {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LocalSource localSource = LocalSource.getInstance();
    Map data = Get.arguments is Map ? Get.arguments : {};
    return Scaffold(
      backgroundColor: AppColors.blue50.withOpacity(0.99),
      appBar: AppBar(
        backgroundColor: AppColors.blue50.withOpacity(0.99),
        title: Text('Comments'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.appBarTitle,
      ),
      body: GetBuilder<CommentController>(
        dispose: (a){
          localSource.setComment(a.controller?.myComments ?? []);
          print(localSource.getComment().length);
        },
        builder: (controller) {
          final size = MediaQuery.of(context).size;
          return ModalProgressHUD(
            inAsyncCall: controller.isLoading,
            child: SafeArea(
              child: Visibility(
                visible: !controller.isLoading,
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.lightGreenAccent.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Color.fromRGBO(96, 57, 158, 0.07),
                                        blurRadius: 20,
                                      ),
                                      BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Color.fromRGBO(96, 57, 158, 0.0503198),
                                        blurRadius: 20,
                                      ),
                                    ]),
                                child: Image.asset('assets/png/user.png'),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data['title'],  style: AppTextStyles.appBarTitle,),
                                    SizedBox(height: 10),
                                    Text(data['body']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${Random().nextInt(1000)}',
                                  style: AppTextStyles.appBarTitle.copyWith(
                                      color: AppColors.mainColor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(width: 3),
                                Image.asset(
                                  'assets/png/like.png',
                                  width: 15,
                                  height: 15,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  '${Random().nextInt(1000)}',
                                  style: AppTextStyles.appBarTitle.copyWith(
                                      color: AppColors.mainColor2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(width: 3),
                                Image.asset(
                                  'assets/png/eye.png',
                                  width: 15,
                                  height: 15,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                          child: Text('Comments'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      color: AppColors.red,
                      height: 1,
                    ),
                    Container(
                      height: size.width + 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) =>
                        CardItemsWidget(
                          title: controller.myComments?[index].name,
                          desc:  controller.myComments?[index].body,
                          email: controller.myComments?[index].email,
                        ),
                        itemCount: controller.myComments?.length
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomButton(
        onTap: () => showQuickSettingsBottomSheet(context, controller),
        margin: EdgeInsets.all(20),
        child: Text('Add Comment'),
        color: AppColors.green,
      ),
    );
  }
}
void showQuickSettingsBottomSheet(
    BuildContext context, CommentController notifier) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
    ),
    isScrollControlled: true,
    builder: (context) => StatefulBuilder(
      builder: (context, state) {
        TextEditingController editingController1 = TextEditingController();
        TextEditingController editingController2 = TextEditingController();
        TextEditingController editingController3 = TextEditingController();
        LocalSource localSource = LocalSource.getInstance();
        return GetBuilder<CommentController>(
          builder: (controller) {
            return Container(
              height: 600,
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Center(child: Text('Add Comment')),
                  SizedBox(height: 20),
                  CustomCircleTextField(
                    hintText: "Write a email",
                    enabledTitle: true,
                    controller: editingController1,
                    titleField: 'Email',
                  ),
                  SizedBox(height: 20),
                  CustomCircleTextField(
                    hintText: "Write a name",
                    enabledTitle: true,
                    titleField: 'Name',
                    controller: editingController2,
                  ),
                  const SizedBox(height: 24),
                  CustomCircleTextField(
                    enabledTitle: true,
                    titleField: 'Comment',
                    maxLines: 5,
                    controller: editingController3,
                    hintText: "Write a comment",
                  ),
                  CustomButton(
                    onTap: (){
                      notifier.myComments?.add(Comment(
                        id: controller.myComments?[0].id,
                        name: editingController2.text,
                        body: editingController3.text,
                        email: editingController1.text,
                        postId: controller.myComments?[0].postId,
                      ));
                      localSource.setComment(controller.myComments ?? []);

                      // localSource.getComment().removeLast();
                      notifier.update();
                      Get.back();
                    },
                    margin: EdgeInsets.all(20),
                    child: Text('Send'),
                    color: AppColors.green,
                  )
                ],
              ),
            );
          }
        );
      },
    ),
  );
}