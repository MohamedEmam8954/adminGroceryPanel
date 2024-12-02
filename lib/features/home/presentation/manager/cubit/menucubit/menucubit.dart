import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubitstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuCubit extends Cubit<Menucubitstate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _gridScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _addProductScaffoldKey =
      GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _allOrderScaffoldKey =
      GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _showproductdata = GlobalKey<ScaffoldState>();

  MenuCubit() : super(InitialMenucubitstate());

  GlobalKey<ScaffoldState> get getScaffoldKey => _scaffoldKey;
  GlobalKey<ScaffoldState> get getGridScaffoldKey => _gridScaffoldKey;
  GlobalKey<ScaffoldState> get getAddProductScaffoldKey =>
      _addProductScaffoldKey;
  GlobalKey<ScaffoldState> get getAllOrderScaffoldKey => _allOrderScaffoldKey;
  GlobalKey<ScaffoldState> get showproductdata => _showproductdata;

  void controlDashboardMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void controlProductMenu() {
    if (!_gridScaffoldKey.currentState!.isDrawerOpen) {
      _gridScaffoldKey.currentState!.openDrawer();
    }
  }

  void controlShowProduct() {
    if (!_showproductdata.currentState!.isDrawerOpen) {
      _showproductdata.currentState!.openDrawer();
    }
  }

  void controlAddProductMenu() {
    if (!_addProductScaffoldKey.currentState!.isDrawerOpen) {
      _addProductScaffoldKey.currentState!.openDrawer();
    }
  }

  void controlAllOrderMenu() {
    if (!_allOrderScaffoldKey.currentState!.isDrawerOpen) {
      _allOrderScaffoldKey.currentState!.openDrawer();
    }
  }

  void controlHomeView() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
