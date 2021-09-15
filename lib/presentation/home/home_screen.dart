import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_clone/presentation/home/controllers/home.controller.dart';

import 'widgets/botton_nav_bar.dart';
import 'widgets/home_tab.dart';
import 'widgets/profile_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: BottonNavBar(),
          ),
          body: PageView(
            controller: _.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeTab(),
              ProfileTab(),
            ],
          ),
        );
      },
    );
  }
}
