import 'package:get/get.dart';
import 'package:git_clone/domain/data/interfaces/preferences_repository_impl.dart';
import 'package:git_clone/domain/data/preferences_reposiitory.dart';
import 'package:git_clone/domain/data/projects_repository.dart';
import 'package:git_clone/domain/data/interfaces/projects_repository_impl.dart';
import 'package:git_clone/domain/data/interfaces/user_repository_impl.dart';
import 'package:git_clone/domain/data/user_repository.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
  // final _preferences =  SharedPreferences.getInstance();

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(),
    );
    Get.lazyPut<ProjectsRepository>(
      () => ProjectsRepositoryImpl(),
    );
  }
}
