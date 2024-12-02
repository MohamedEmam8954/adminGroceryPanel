// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/appthemecubit/appthemecubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Utils {
  BuildContext context;
  Utils(
    this.context,
  );
  color() {
    return context.read<Appthemecubit>().getTheme()
        ? Colors.white
        : Colors.black;
  }
}
