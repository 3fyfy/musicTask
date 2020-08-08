
import 'package:get_it/get_it.dart';
import 'package:musictask/Core/services/api.dart';
import 'package:musictask/Core/viewmodels/widgets/album_model.dart';


GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => AlbumModel());


}
