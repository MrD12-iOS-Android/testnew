import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testnew/controller/main/detail_controller.dart';
import 'package:testnew/controller/main/home/home_controller.dart';
import 'package:testnew/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:testnew/core/theme/app_text_style.dart';
import 'package:testnew/routes/app_routes.dart';
import 'package:testnew/ui/main/home/widgets/button_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.appBarTitle,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return GetBuilder<DetailController>(
            builder: (con) {
              return SafeArea(
                child: ModalProgressHUD(
                  inAsyncCall: controller.isLoading,
                  child: Visibility(
                    visible: !controller.isLoading,
                    child: Container(
                      padding: EdgeInsets.only(top: 30),
                      child: ListView.builder(
                        itemCount: controller.myUsers.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return CellUserWidget(
                            onPressed: () {
                              print(index);
                              Get.toNamed(
                                Routes.DETAIL,
                              arguments: {
                                  'id' : controller.myUsers[index].id,
                                  'username' : controller.myUsers[index].username,
                                  'name' : controller.myUsers[index].name,
                                  'email' : controller.myUsers[index].email,
                                  'phone' : controller.myUsers[index].phone,
                                  'web' : controller.myUsers[index].website,
                                  'company1' : controller.myUsers[index].company!.name,
                                  'company2' : controller.myUsers[index].company!.bs,
                                  'company3' : controller.myUsers[index].company!.catchPhrase,
                              },
                            );
                            con.getMyPhotos(index + 1);
                            con.getMyPosts(index + 1);
                            },
                            text: controller.myUsers[index].username,
                            surName: controller.myUsers[index].name,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            }
          );
        }
      ),
    );
  }
}
