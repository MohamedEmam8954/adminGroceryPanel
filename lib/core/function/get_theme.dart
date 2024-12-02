import 'package:admingrocerypanel/core/cache/cachehelper.dart';
import 'package:admingrocerypanel/core/constant/constant.dart';
import 'package:admingrocerypanel/core/utils/dependency_injection.dart';

abstract class GetTheme {
  static bool gettheme = getIt.get<BoolCacheOperation>().get(appTheme);
}
