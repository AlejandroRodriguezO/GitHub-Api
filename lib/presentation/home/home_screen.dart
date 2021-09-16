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
          floatingActionButton: _.paginaActual == 0
              ? FloatingActionButton(
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        title: Text('Nuevo Repositorio'),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: _.ctrlName,
                                decoration: InputDecoration(
                                  labelText: 'Nombre',
                                ),
                              ),
                              TextFormField(
                                controller: _.ctrlDesc,
                                decoration: InputDecoration(
                                  labelText: 'Descripción',
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              if (_.ctrlName.text.isNotEmpty &&
                                  _.ctrlDesc.text.isNotEmpty) {
                                _.create();
                                _.ctrlName.clear();
                                _.ctrlDesc.clear();
                                Get.back();
                              }
                            },
                            child: Text('Crear'),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                              _.ctrlName.clear();
                              _.ctrlDesc.clear();
                            },
                            child: Text('Cancelar'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
