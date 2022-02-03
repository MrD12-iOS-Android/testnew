import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:testnew/base/base_controller.dart';
import 'package:testnew/core/constants/constants.dart';
import 'package:testnew/data/data_source/local_source.dart';
import 'package:testnew/data/models/banners/banners_response.dart';
import 'package:testnew/data/models/categories/category_response.dart';
import 'package:testnew/data/models/orders/orders_response.dart';
import 'package:testnew/data/models/products/products_response.dart';
import 'package:testnew/data/repository/home/home_repository.dart';
import 'package:get/get.dart';

class DetailController extends BaseController with SingleGetTickerProviderMixin {

  @override
  void onInit() {
    super.onInit();
  }

}
