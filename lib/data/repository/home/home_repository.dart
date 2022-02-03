import 'package:dio/dio.dart';
import 'package:testnew/base/base_repository.dart';
import 'package:testnew/data/models/banners/banners_response.dart';
import 'package:testnew/data/models/categories/category_response.dart';
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



  Future<ResponseHandler<MyUsers>> fetchMyUsers() async {
    MyUsers response;
    try {
      response = await apiClient!.getMyUsers();
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }


  Future<dynamic> getUser() async {
    final response = await fetchMyUsers();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

}
