import 'dart:developer';
import 'package:admingrocerypanel/core/cache/cachehelper.dart';
import 'package:admingrocerypanel/core/constant/app_theme.dart';
import 'package:admingrocerypanel/core/constant/constant.dart';
import 'package:admingrocerypanel/core/models/blocObserver.dart';
import 'package:admingrocerypanel/core/utils/app_router.dart';
import 'package:admingrocerypanel/core/utils/dependency_injection.dart';
import 'package:admingrocerypanel/features/home/data/repo/repo/homerepoimp.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/datacubit/datacubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/menucubit/menucubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/appthemecubit/appthemecubit.dart';
import 'package:admingrocerypanel/features/home/presentation/manager/cubit/appthemecubit/appthemestate.dart';
import 'package:admingrocerypanel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  await getIt.get<Cachehelper>().init();
  Bloc.observer = MyBlocObserver();
  runApp(const AdminPanel());
}

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Appthemecubit(getIt.get<BoolCacheOperation>()),
        ),
        BlocProvider(
          create: (context) => MenuCubit(),
        ),
        BlocProvider(
          create: (context) => Datacubit(getIt.get<Homerepoimp>()),
        )
      ],
      child: BlocBuilder<Appthemecubit, AppThemeState>(
        builder: (context, state) {
          log("the theme is ${getIt.get<BoolCacheOperation>().get(appTheme)}");
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeData(
                context.read<Appthemecubit>().getTheme(), context),
            routerConfig: AppRouter.goRoute,
          );
        },
      ),
    );
  }
}
