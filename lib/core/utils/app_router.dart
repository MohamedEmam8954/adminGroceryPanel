import 'package:admingrocerypanel/features/home/data/model/product_model.dart';
import 'package:admingrocerypanel/features/home/presentation/views/addproductview.dart';
import 'package:admingrocerypanel/features/home/presentation/views/show_product_view.dart';
import 'package:admingrocerypanel/features/viewallproduct/presentation/views/allproductview.dart';
import 'package:admingrocerypanel/features/home/presentation/views/homeView.dart';
import 'package:admingrocerypanel/features/viewallorder/presentation/views/viewallorder.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String allProductView = "/allproductview";
  static const String viewallOrder = "/viewallorder";
  static const String addProductView = "/addProductView";
  static const String homeView = "/homeView";
  static const String showProductView = "/showProductView";
  static GoRouter goRoute = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: homeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: showProductView,
      builder: (context, state) => ShowProductView(
        productModel: state.extra as ProductModel,
      ),
    ),
    GoRoute(
      path: allProductView,
      builder: (context, state) => const AllProductView(),
    ),
    GoRoute(
      path: viewallOrder,
      builder: (context, state) => const ViewAllOrder(),
    ),
    GoRoute(
      path: addProductView,
      builder: (context, state) => const AddProductView(),
    ),
  ]);
}
