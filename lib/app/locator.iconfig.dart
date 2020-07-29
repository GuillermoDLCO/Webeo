// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:webeoapp/services/api.dart';
import 'package:webeoapp/services/app_model_service.dart';
import 'package:webeoapp/services/third_parties_service_module.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webeoapp/services/google_sign_service.dart';
import 'package:webeoapp/services/media_services.dart';
import 'package:webeoapp/services/secure_storage_service.dart';
import 'package:webeoapp/services/storage_service.dart';
import 'package:webeoapp/services/token.dart';
import 'package:webeoapp/services/user_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<Api>(() => Api());
  g.registerLazySingleton<AppModel>(() => AppModel());
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<GoogleSign>(() => GoogleSign());
  g.registerLazySingleton<MediaService>(() => MediaService());
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<SecureStorage>(() => SecureStorage());
  g.registerLazySingleton<Storage>(() => Storage());
  g.registerLazySingleton<Token>(() => Token());
  g.registerLazySingleton<UserService>(() => UserService());
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
