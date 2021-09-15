import 'package:get/get.dart';
import 'package:git_clone/domain/data/projects_repository.dart';
import 'package:git_clone/domain/data/interfaces/projects_repository_impl.dart';
import 'package:git_clone/domain/data/interfaces/user_repository_impl.dart';
import 'package:git_clone/domain/data/user_repository.dart';
import 'package:git_clone/presentation/login/controller/login_controller.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProjectsRepository>(
      () => ProjectsRepositoryImpl(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(),
    );
  }
}
