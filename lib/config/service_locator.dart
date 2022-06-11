import 'package:bovua/stores/page_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// Registers services to be created only once
void setupLocators() {
  // Registering our store to be created only once
  GetIt.I.registerSingleton<PageStore>(PageStore());
}
