import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String imgUrl,
      orderId,
      price,
      productId,
      quantity,
      title,
      totalPrice,
      userId,
      userName;
  final Timestamp orderDate;

  OrderModel(
      {required this.imgUrl,
      required this.orderId,
      required this.price,
      required this.productId,
      required this.quantity,
      required this.title,
      required this.totalPrice,
      required this.userId,
      required this.userName,
      required this.orderDate});

  factory OrderModel.fromFb(fromfb) {
    return OrderModel(
        imgUrl: fromfb['imgUrl'],
        orderId: fromfb['orderId'],
        price: fromfb['price'],
        productId: fromfb['productId'],
        quantity: fromfb['quantity'],
        title: fromfb['title'],
        totalPrice: fromfb['totalPrice'],
        userId: fromfb['userId'],
        userName: fromfb['userName'],
        orderDate: fromfb['orderDate']);
  }
}
