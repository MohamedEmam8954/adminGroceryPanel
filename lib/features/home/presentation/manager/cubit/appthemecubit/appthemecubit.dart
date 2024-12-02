import 'package:admingrocerypanel/core/cache/cachehelper.dart';
import 'package:admingrocerypanel/core/constant/constant.dart';
import 'package:admingrocerypanel/core/utils/dependency_injection.dart';

import 'package:admingrocerypanel/features/home/presentation/manager/cubit/appthemecubit/appthemestate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Appthemecubit extends Cubit<AppThemeState> {
  Appthemecubit(this.boolCacheOperation) : super(AppthemeInitial());

  BoolCacheOperation boolCacheOperation;

  bool getTheme() {
    bool light = getIt.get<BoolCacheOperation>().get(appTheme);

    return light;
  }

  setTheme({required bool value, required String key}) async {
    await boolCacheOperation.sendData(key: key, value: value);
    emit(AppthemeSucess());
  }
}
