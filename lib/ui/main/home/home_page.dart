import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testnew/controller/main/home/home_controller.dart';
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
          return SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: 30),
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CellUserWidget(
                    onPressed: () => Get.toNamed(Routes.DETAIL),
                    text: 'aa',
                    surName: 'Surname',
                  );
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
