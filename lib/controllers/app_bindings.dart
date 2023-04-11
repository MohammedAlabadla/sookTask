import 'package:get/instance_manager.dart';
import 'repos_controller.dart';
import 'search_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    //
    Get.lazyPut(() => ReposController(), fenix: true);
    Get.lazyPut(() => SearchController(), fenix: true);

    //
  }
}
