
import 'package:testnew/base/base_controller.dart';
import 'package:testnew/data/data_source/local_source.dart';
import 'package:testnew/data/models/comment_response.dart';
import 'package:testnew/data/repository/home/home_repository.dart';
import 'package:get/get.dart';

class CommentController extends BaseController {


  HomeRepository repository;
  List<Comment>? _myComments;

  LocalSource localSource = LocalSource.getInstance();

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
      localSource.setComment(result);
      _myComments = localSource.getComment();
      update();
    } else {
      print('keldmadi');
      Get.snackbar('error'.tr, result.toString());
    }
  }


  Future<bool> sellCollecting() async {
    setLoading(true);
    var request = Comment(
      id: 1000,
      postId: 120,
      name: 'qweqweqwe',
      body: 'ckxnvkxncvm,xncvmxcvm,xcvnmxvc,mnxv,xcvn,m',
      email: 'aaaaasdasdpamdklxcvkjxncvjknjxvkcnjkx.gmail.com'
    );
    final result = await repository.setCollecting(request: request, id: 1);
    setLoading(false);
    if (result is Comment) {
      print('lllllllll');
      return true;
    } else {
      print('00000000');
      Get.snackbar('Ошибка', result.toString());
      return false;
    }
  }




  List<Comment>? get myComments => _myComments;

}
