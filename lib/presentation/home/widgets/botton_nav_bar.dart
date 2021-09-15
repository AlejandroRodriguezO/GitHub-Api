import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_clone/presentation/home/controllers/home.controller.dart';

class BottonNavBar extends StatelessWidget {
  const BottonNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return BottomNavigationBar(
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(
            color: Colors.blue
          ),
          selectedItemColor: Colors.blue,
           currentIndex: _.paginaActual,
           onTap: (i) => _.paginaActual = i,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: 'Perfil')
          ],
        );
      },
    );
  }
}
