import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_clone/domain/data/user_repository.dart';
import 'package:git_clone/presentation/local.dart';

class LoginController extends GetxController {
  final ctrlUsername = TextEditingController();

  final UserRepository userRepository = Get.find();

 void fetchData() async {
    userData = await userRepository.query(username:ctrlUsername.text);
    update();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
