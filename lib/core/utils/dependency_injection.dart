import 'package:admingrocerypanel/core/cache/cachehelper.dart';
import 'package:admingrocerypanel/features/home/data/repo/repo/homerepoimp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Cachehelper>(Cachehelper());
  getIt.registerSingleton<BoolCacheOperation>(BoolCacheOperation());
  getIt.registerSingleton<Homerepoimp>(Homerepoimp());
}
