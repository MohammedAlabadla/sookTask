import 'package:get/instance_manager.dart';
import 'package:sookps/controllers/repositories_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    //
    Get.put(() => RepositoriesController(), permanent: true);
    //
  }
}
