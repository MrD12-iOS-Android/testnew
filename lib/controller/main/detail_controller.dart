
import 'package:testnew/base/base_controller.dart';
import 'package:testnew/data/models/photos_response.dart';
import 'package:testnew/data/models/posts_response.dart';
import 'package:testnew/data/repository/home/home_repository.dart';
import 'package:get/get.dart';

class DetailController extends BaseController {


  HomeRepository repository;
  List<Photos>? _myPhotos;
  List<Posts>? _myPosts;






  DetailController({
    required this.repository,
  }) : assert(repository != null);

  @override
  void onInit() {
    super.onInit();
  }

  void getMyPhotos(int id) async {
    final result = await repository.getPhotos(id: id);
    if (result is List<Photos>) {
      print('keldi');
      _myPhotos = result;
      update();
    } else {
      print('keldmadi');
      Get.snackbar('error'.tr, result.toString());
    }
  }


  void getMyPosts(int id) async {
    final result = await repository.getPhotos(id: id);
    if (result is List<Posts>) {
      print('keldi');
      _myPosts = result;
      update();
    } else {
      print('keldmadi');
      Get.snackbar('error'.tr, result.toString());
    }
  }




  List<Photos>? get myPhotos => _myPhotos;
  List<Posts>? get myPosts => _myPosts;

}
