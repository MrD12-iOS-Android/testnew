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

class HomeController extends BaseController with SingleGetTickerProviderMixin {
  final HomeRepository? repository;
  LocalSource _localSource = LocalSource.getInstance();

  HomeController({
    required this.repository,
  }) : assert(repository != null);

  List<Banners> _banners = [];
  List<Categories> _categories = [];
  List<Orders> _orders = [];
  int _index = 0;
  late TabController tabController;
  final scrollController = ScrollController();

  @override
  void onInit() {
    getBanners();
    getCategoryWithProducts();
    tabController = TabController(length: 1, vsync: this);
    super.onInit();
  }

  void setIndex(int i) {
    _index = i;
    update();
  }

  Future<void> getBanners() async {
    setLoading(true);
    final result = await repository?.getBanners(shipperId: Constants.shipperId);
    if (result is BannersResponse) {
      _banners = result.banners;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getCategoryWithProducts() async {
    setLoading(true);
    final result = await repository?.getCategoryWithProducts(
      shipperId: Constants.shipperId,
    );
    setLoading(false);
    if (result is CategoryResponse) {
      _categories = result.categories.where((element) {
        if (element.products.isNotEmpty)
          return true;
        else if (element.childCategories.isNotEmpty &&
            element.childCategories[0].products.isNotEmpty)
          return true;
        else
          return false;
      }).toList();
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
      setLoading(false);
    }
  }

  Future<List<Products>> searchProduct(String? search) async {
    setLoading(true);
    final result = await repository?.getSearchProducts(
      shipperId: Constants.shipperId,
      search: search ?? '',
    );
    setLoading(false);
    if (result is ProductsResponse) {
      return result.products;
    } else {
      Get.snackbar('error'.tr, result.toString());
      return [];
    }
  }

  void changeIsCheckedCategory(int index) {
    _categories[index].isChecked = !_categories[index].isChecked;
    update();
  }

  List<Banners> get banners => _banners;

  List<Categories> get categories => _categories;

  List<Orders> get order => _orders;

  int get index => _index;

  List<Categories> get checkedCategories =>
      _categories.where((element) => element.isChecked).toList();
}
