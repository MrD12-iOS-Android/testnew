import 'package:floor/floor.dart';
import 'package:testnew/data/floor/entity/products.dart';
import 'package:testnew/data/models/comment_response.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM Products')
  Stream<List<Products>> getBasketProducts();
  @Query('SELECT * FROM Products')
  Future<List<Products>> getBasketProductsAsync();





  @insert
  Future<void> insertProduct(Products product);

  @delete
  Future<void> removeProduct(Products product);

  @update
  Future<void> updateProduct(Products product);

  @delete
  Future<void> removeAll(List<Products> products);
}
