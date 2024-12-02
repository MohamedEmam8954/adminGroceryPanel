import 'package:admingrocerypanel/core/utils/appstyles.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/data_cubit_state.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:admingrocerypanel/features/home/presentation/widgets/orderItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderListItems extends StatefulWidget {
  const OrderListItems({super.key});

  @override
  State<OrderListItems> createState() => _OrderListItemsState();
}

class _OrderListItemsState extends State<OrderListItems> {
  @override
  void initState() {
    context.read<Datacubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Datacubit, DataCubitState>(
      builder: (context, state) {
        var orderList = context.read<Datacubit>().orderList;

        if (orderList.isEmpty) {
          return Center(
            child: Text(
              "NoOrdersNow",
              style: AppStyles.style18,
            ),
          );
        }
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Orderitem(
                orderModel: orderList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const Column(
                children: [
                  Divider(
                    thickness: 2,
                    indent: 5,
                    endIndent: 5,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              );
            },
            itemCount: orderList.length);
      },
    );
  }
}
