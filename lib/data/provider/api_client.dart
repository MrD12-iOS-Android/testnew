
import 'package:chuck_interceptor/chuck_interceptor.dart';
import 'package:testnew/core/constants/constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:testnew/data/models/banners/banners_response.dart';
import 'package:testnew/data/models/categories/category_response.dart';
import 'package:testnew/data/models/comment_response.dart';
import 'package:testnew/data/models/photos_response.dart';
import 'package:testnew/data/models/posts_response.dart';
import 'package:testnew/data/models/products/products_response.dart';
import 'package:testnew/data/models/token/refresh_token_request.dart';
import 'package:testnew/data/models/token/refresh_token_response.dart';
import 'package:testnew/data/models/user_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiClient {
  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    ///Alice chuck interceptor
    dio.interceptors.add(alice.getDioInterceptor());

    /// Tries the last error request again.
    // dio.interceptors.add(RetryInterceptor(
    //   dio: dio,
    //   toNoInternetPageNavigator: () async =>
    //       await Get.back()),
    //   accessTokenGetter: () => LocalSource.getInstance().getAccessToken(),
    //   refreshTokenFunction: BaseFunctions.refreshToken,
    // ));
    dio.interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true, request: true));
    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = Constants.baseUrl}) {
    if (_apiClient != null)
      return _apiClient!;
    else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  /// Get banner list
  @GET('banner')
  Future<BannersResponse> getBanners(
    @Header('Shipper') String shipperId,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// Get categories and products
  @GET('category')
  Future<CategoryResponse> getCategoryWithProduct(
    @Header('Shipper') String shipperId,
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('with_products') bool withProducts,
    @Query('all') bool all,
  );

  /// Get product info
  @GET('product/{product_id}')
  Future<Products> getProductDetail(
    @Header('Shipper') String shipperId,
    @Path('product_id') String productId,
  );

  /// Get all products
  @GET('product')
  Future<ProductsResponse> getProducts(
    @Header('Shipper') String shipperId,
    @Query('search') String search,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('customers/refresh-token')
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequest request,
  );

  @GET('users')
  Future<List<MyUsers>> getMyUsers();

  @GET('photos')
  Future<List<Photos>> getMyPhotos(
      @Query('albumId') int id,
  );

  @GET('posts')
  Future<List<Posts>> getMyPosts(
      @Query('userId') int userId,
  );

  @GET('comments')
  Future<List<Comment>> getMyComments(
      @Query('postId') int postId,
  );


  @POST('posts/{postId}/comments')
  Future<Comment> setComments(
      @Body() Comment request,
      @Path('postId') int? postId,
      );



}
