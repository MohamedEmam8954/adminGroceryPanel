import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Homerepo {
  Future<void> addProduct({
    required String productTitle,
    required String price,
    required String productCategory,
    required int ispiece,
    required String imageUrl,
  });

  Future<void> updateProduct({
    required String id,
    required String productTitle,
    required String price,
    required String productCategory,
    required int ispiece,
    required String imageUrl,
    required double priceAfterSale,
    required bool isOnSale,
    required String percent,
  });

  Future<void> deleteProduct(String id);

  Stream<QuerySnapshot<Object?>> getOrders();
}
