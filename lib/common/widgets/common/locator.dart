import 'package:get_it/get_it.dart';
import 'package:swd_app/modules/auth/service/auth-service.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => AuthService());
}
