import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testnew/controller/main/detail_controller.dart';
import 'package:testnew/controller/main/home/home_controller.dart';
import 'package:testnew/core/custom_widgets/custom_button/custom_button.dart';
import 'package:testnew/core/theme/app_colors.dart';
import 'package:testnew/core/theme/app_text_style.dart';
import 'package:testnew/data/models/user_response.dart';
import 'package:testnew/ui/main/home/widgets/button_widget.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map data = Get.arguments is Map ? Get.arguments : {};
    return Scaffold(
      backgroundColor: AppColors.blue50.withOpacity(0.99),
      appBar: AppBar(
        backgroundColor: AppColors.blue50.withOpacity(0.99),
        title: Text(data['username']),
        centerTitle: true,
        titleTextStyle: AppTextStyles.appBarTitle,
      ),
      body: GetBuilder<DetailController>(
        builder: (controller) {
          final size = MediaQuery.of(context).size;
          return SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(data['name']),
                      SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 100,
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
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(400),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          color: Color.fromRGBO(96, 57, 158, 0.07),
                          blurRadius: 20,
                        ),
                        BoxShadow(
                          offset: Offset(0, 3),
                          color: Color.fromRGBO(96, 57, 158, 0.103198),
                          blurRadius: 20,
                        ),
                      ]),
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color:
                                      Colors.lightGreenAccent.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      color: Color.fromRGBO(96, 57, 158, 0.07),
                                      blurRadius: 20,
                                    ),
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      color: Color.fromRGBO(
                                          96, 57, 158, 0.0503198),
                                      blurRadius: 20,
                                    ),
                                  ]),
                              child: Image.asset('assets/png/gmail.png')),
                          SizedBox(width: 10),
                          Text(data['email']),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color:
                                      Colors.lightGreenAccent.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      color: Color.fromRGBO(96, 57, 158, 0.07),
                                      blurRadius: 20,
                                    ),
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      color: Color.fromRGBO(
                                          96, 57, 158, 0.0503198),
                                      blurRadius: 20,
                                    ),
                                  ]),
                              child: Image.asset('assets/png/call.png')),
                          SizedBox(width: 10),
                          Text(data['phone']),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color:
                                      Colors.lightGreenAccent.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      color: Color.fromRGBO(96, 57, 158, 0.07),
                                      blurRadius: 20,
                                    ),
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      color: Color.fromRGBO(
                                          96, 57, 158, 0.0503198),
                                      blurRadius: 20,
                                    ),
                                  ]),
                              child: Image.asset('assets/png/web.png')),
                          SizedBox(width: 10),
                          Text(data['web']),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color:
                                      Colors.lightGreenAccent.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      color: Color.fromRGBO(96, 57, 158, 0.07),
                                      blurRadius: 20,
                                    ),
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      color: Color.fromRGBO(
                                          96, 57, 158, 0.0503198),
                                      blurRadius: 20,
                                    ),
                                  ]),
                              child: Image.asset('assets/png/office.png')),
                          SizedBox(width: 10),
                          Text('Company'),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            width: 3,
                            height: 3,
                            margin: EdgeInsets.only(left: 40),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(data['company1']),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Container(
                            width: 3,
                            height: 3,
                            margin: EdgeInsets.only(left: 40),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(data['company2']),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Container(
                            width: 3,
                            height: 3,
                            margin: EdgeInsets.only(left: 40),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(data['company3']),
                        ],
                      ),
                      SizedBox(height: 60),
                      CustomButton(
                        width: 120,
                        color: Colors.transparent,
                        onTap: () {},
                        child: Text('See all albums', style: AppTextStyles.appBarTitle,),
                      ),
                      Container(
                        height: 150,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.myPhotos?.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                                child: Container(
                                  width: 150,
                                  child: Center(
                                    child: CachedNetworkImage(
                                      imageUrl: controller.myPhotos?[index].url ?? '',
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        width: 130,
                        color: Colors.transparent,
                        onTap: () {},
                        child: Text('See all posts', style: AppTextStyles.appBarTitle,),
                      ),
                      ListView.builder(
                        itemCount: controller.myPosts?.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return CellUserWidget(
                            onPressed: () {},
                            text: controller.myPosts?[index].title,
                            surName: controller.myPosts?[index].body,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
