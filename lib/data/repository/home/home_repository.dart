import 'package:dio/dio.dart';
import 'package:testnew/base/base_repository.dart';
import 'package:testnew/data/models/banners/banners_response.dart';
import 'package:testnew/data/models/categories/category_response.dart';
import 'package:testnew/data/models/photos_response.dart';
import 'package:testnew/data/models/photos_response.dart';
import 'package:testnew/data/models/posts_response.dart';
import 'package:testnew/data/models/products/products_response.dart';
import 'package:testnew/data/models/user_response.dart';
import 'package:testnew/data/provider/api_client.dart';
import 'package:testnew/data/provider/response_handler.dart';
import 'package:testnew/data/provider/server_error.dart';

class HomeRepository extends BaseRepository {
  ApiClient? apiClient;

  HomeRepository({required this.apiClient}) : assert(apiClient != null);


  Future<ResponseHandler<CategoryResponse?>> _fetchCategoryWithProducts(
      {required String shipperId, int page = 1, int limit = 1000}) async {
    CategoryResponse response;
    try {
      response = await apiClient!
          .getCategoryWithProduct(shipperId, page, limit, true, false);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getCategoryWithProducts({required String shipperId}) async {
    final response = await _fetchCategoryWithProducts(shipperId: shipperId);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }



  Future<ResponseHandler<List<MyUsers>>> fetchMyUsers() async {
    List<MyUsers> response;
    try {
      print('keldi111');
      response = (await apiClient!.getMyUsers());
    } catch (error, stacktrace) {
      print('keldmadiiieeeee');
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getUser() async {
    final response = await fetchMyUsers();
    if (response.data != null) {
      print('keldi');
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      print('kelmadimmmm');
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }









  Future<ResponseHandler<List<Photos>>> fetchMyPhotos({int id = 0}) async {
    List<Photos> response;
    try {
      response = (await apiClient!.getMyPhotos(id));
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
  Future<dynamic> getPhotos({int id = 0}) async {
    final response = await fetchMyPhotos(id: id);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }












  Future<ResponseHandler<List<Posts>>> fetchMyPosts({int id = 0}) async {
    List<Posts> response;
    try {
      response = (await apiClient!.getMyPosts(id));
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
  Future<dynamic> getPosts({int id = 0}) async {
    final response = await fetchMyPhotos(id: id);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }
}
