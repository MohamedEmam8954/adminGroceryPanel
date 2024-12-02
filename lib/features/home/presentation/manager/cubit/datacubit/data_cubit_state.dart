import 'package:admingrocerypanel/features/home/data/model/order_model.dart';

class DataCubitState {}

class InitilaDataCubitState extends DataCubitState {}

class LoadingDataCubitState extends DataCubitState {}

class DataCubitStateAddedSucessfully extends DataCubitState {}

class DataCubitStateFailure extends DataCubitState {
  final String errorMessage;

  DataCubitStateFailure({required this.errorMessage});
}

//! update product state
class LoadingUpdateProductState extends DataCubitState {}

class UpdateProductSucessfully extends DataCubitState {}

class UpdateProductStateFailure extends DataCubitState {
  final String errorMessage;

  UpdateProductStateFailure({required this.errorMessage});
}

//! delete product state
class DeleteLoadingState extends DataCubitState {}

class DeleteSucessState extends DataCubitState {}

class DeleteFailureState extends DataCubitState {
  final String errorMessage;

  DeleteFailureState({required this.errorMessage});
}

//! fetch orders
class OrdersLoading extends DataCubitState {}

class OrdersSuccess extends DataCubitState {
  final List<OrderModel> ordersList;

  OrdersSuccess({required this.ordersList});
}

class OrdersFailures extends DataCubitState {
  final String errorMessage;

  OrdersFailures({required this.errorMessage});
}
