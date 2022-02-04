import 'package:flutter/material.dart';
import 'package:testnew/base/base_controller.dart';
import 'package:testnew/data/data_source/local_source.dart';
import 'package:testnew/data/models/user_response.dart';
import 'package:testnew/data/repository/home/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  HomeRepository repository;
  LocalSource _localSource = LocalSource.getInstance();

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
      print('keldi');

      _myUsers = result;
      var i = MyUsers();
      i.id = 22;
      i.name = 'aaaaaa';
      _myUsers.add(i);
      update();
    } else {
      print('keldmadi');
      Get.snackbar('error'.tr, result.toString());
    }
  }

  List<MyUsers> get myUsers => _myUsers;
}
