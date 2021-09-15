import 'package:get/get.dart';
import 'package:git_clone/infrastructure/navigation/bindings/login_controller_binding.dart';

import '../../presentation/screens.dart';
import 'bindings/controllers_bindings.dart';
import 'routes.dart';



class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginControllerBinding(),
    ),
  ];
}
