import 'package:get/get.dart';
import 'package:git_clone/domain/data/interfaces/user_repository_impl.dart';
import 'package:git_clone/domain/data/user_repository.dart';
import 'package:git_clone/presentation/login/controller/login_controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(),
    );
  }
}