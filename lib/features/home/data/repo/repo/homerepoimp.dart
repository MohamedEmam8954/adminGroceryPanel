import 'package:admingrocerypanel/features/home/data/repo/repo/homerepo.dart';
import 'package:admingrocerypanel/features/home/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Homerepoimp extends Homerepo {
  @override
  Future<void> addProduct(
      {required String productTitle,
      required String price,
      required String productCategory,
      required int ispiece,
      required String imageUrl}) async {
    var uuid = const Uuid().v4();
    await FirebaseServices.fetchFirebase().doc(uuid).set({
      "productTitle": productTitle,
      "price": price,
      "productCategory": productCategory,
      "salePrice": "0",
      "id": uuid,
      "imgUrl": imageUrl,
      "isPiece": ispiece,
      "createdAt": Timestamp.now(),
      "isonsale": false,
      "priceAfterSale": 0,
      "percent": "0",
      "quantity": "1",
    });
  }

  @override
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
  }) async {
    await FirebaseServices.fetchFirebase().doc(id).update({
      "productTitle": productTitle,
      "price": price,
      "productCategory": productCategory,
      "salePrice": "0",
      "id": id,
      "imgUrl": imageUrl,
      "isPiece": ispiece,
      "createdAt": Timestamp.now(),
      "isonsale": isOnSale,
      "priceAfterSale": priceAfterSale,
      "percent": percent,
      "quantity": "1",
    });
  }

  @override
  Future<void> deleteProduct(String id) async {
    await FirebaseServices.fetchFirebase().doc(id).delete();
  }

  @override
  Stream<QuerySnapshot<Object?>> getOrders() {
    return FirebaseServices.fetchOrders().snapshots();
  }
}
