import 'dart:developer';

import 'package:admingrocerypanel/features/home/data/model/order_model.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/data_cubit_state.dart';
import 'package:admingrocerypanel/features/home/data/repo/repo/homerepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Datacubit extends Cubit<DataCubitState> {
  Datacubit(this.homerepoimp) : super(InitilaDataCubitState());
  Homerepo homerepoimp;
  List<OrderModel> orderList = [];

  sendData({
    required String productTitle,
    required String price,
    required String productCategory,
    required int ispiece,
    required String imgUrl,
  }) async {
    try {
      emit(LoadingDataCubitState());
      await homerepoimp.addProduct(
          productTitle: productTitle,
          price: price,
          productCategory: productCategory,
          ispiece: ispiece,
          imageUrl: imgUrl);
      emit(DataCubitStateAddedSucessfully());
    } catch (e) {
      emit(DataCubitStateFailure(errorMessage: e.toString()));
    }
  }

  updateData({
    required String productTitle,
    required String price,
    required String productCategory,
    required int ispiece,
    required String imgUrl,
    required String id,
    required String percent,
    required double priceAfterSale,
    required bool isOnSale,
  }) async {
    try {
      emit(LoadingUpdateProductState());
      await homerepoimp.updateProduct(
          percent: percent,
          isOnSale: isOnSale,
          priceAfterSale: priceAfterSale,
          id: id,
          productTitle: productTitle,
          price: price,
          productCategory: productCategory,
          ispiece: ispiece,
          imageUrl: imgUrl);
      emit(UpdateProductSucessfully());
    } catch (e) {
      emit(UpdateProductStateFailure(errorMessage: e.toString()));
    }
  }

  deleteproduct({required String id}) async {
    await homerepoimp.deleteProduct(id);
  }

  fetchOrders() {
    try {
      emit(OrdersLoading());
      var orderData = homerepoimp.getOrders();

      orderData.listen((data) {
        orderList.clear();
        for (var doc in data.docs) {
          orderList.add(OrderModel.fromFb(doc));
        }
        emit(OrdersSuccess(ordersList: orderList));
      }, onError: (error) {
        log(error.toString());
        emit(OrdersFailures(errorMessage: error.toString()));
      });
    } catch (e) {
      log(e.toString());
      emit(OrdersFailures(errorMessage: e.toString()));
    }
  }
}
