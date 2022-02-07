import 'package:flutter/material.dart';
import 'package:testnew/base/base_controller.dart';
import 'package:testnew/data/data_source/local_source.dart';
import 'package:testnew/data/models/user_response.dart';
import 'package:testnew/data/repository/home/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  HomeRepository repository;

  HomeController({
    required this.repository,
  }) : assert(repository != null);

  List<MyUsers> _myUsers = [];

  @override
  void onInit() {
    super.onInit();
    getMyUsers();
  }

  void getMyUsers() async {
    setLoading(true);
    final result = await repository.getUser();
    setLoading(false);
    if (result is List<MyUsers>) {
      _myUsers = result;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }
  List<MyUsers> get myUsers => _myUsers;
}