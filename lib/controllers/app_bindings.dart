import 'package:get/instance_manager.dart';
import 'repositories_controller.dart';
import 'search_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    //
    Get.lazyPut(() => RepositoriesController(), fenix: true);
    Get.lazyPut(() => SearchController(), fenix: true);

    //
  }
}
