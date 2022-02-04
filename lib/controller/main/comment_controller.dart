
import 'package:testnew/base/base_controller.dart';
import 'package:testnew/data/models/comment_response.dart';
import 'package:testnew/data/repository/home/home_repository.dart';
import 'package:get/get.dart';

class CommentController extends BaseController {


  HomeRepository repository;
  List<Comment>? _myComments;



  CommentController({
    required this.repository,
  }) : assert(repository != null);

  @override
  void onInit() {
    super.onInit();
  }

  void getMyComments(int id) async {
    setLoading(true);
    final result = await repository.getComments(id: id);
    setLoading(false);
    if (result is List<Comment>) {
      print('keldi');
      _myComments = result;
      update();
    } else {
      print('keldmadi');
      Get.snackbar('error'.tr, result.toString());
    }
  }
  List<Comment>? get myComments => _myComments;

}
