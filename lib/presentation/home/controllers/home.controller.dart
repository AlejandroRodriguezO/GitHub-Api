import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_clone/domain/data/projects_repository.dart';
import 'package:git_clone/domain/data/user_repository.dart';
import 'package:git_clone/presentation/local.dart';

class HomeController extends GetxController {
  // ThemeController theme = Get.find();
  UserRepository user = Get.find();
  ProjectsRepository projects = Get.find();

  final ctrlName = TextEditingController();
  final ctrlDesc = TextEditingController();
  final ctrlIssueName = TextEditingController();
  final ctrlIssueDesc = TextEditingController();

  int nRepositories = 10;

  void fetchData() async {
    projectsData = await projects.query(nRepositories);
    userData = await user.query();
    update();
  }
  void addStar(String id) async {
    await projects.addStar(id);
    update();
    fetchData();
  }
  void deleteStar(String id) async {
    await projects.deleteStar(id);
    update();
    fetchData();
  }

  void create() async {
    await projects.createRepository(
      ctrlName.text,
      ctrlDesc.text,
    );
    update();
    fetchData();
  }

  void createIssue(String id) async {
    await projects.createIssue(
      ctrlIssueName.text,
      ctrlIssueDesc.text,
       id,
    );
  }

  ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  int _paginaActual = 0;
  final _pageController = PageController();
  PageController get pageController => _pageController;

  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(
      valor,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
    update();
  }

  @override
  void onInit() {
    fetchData();
    cargar();
    super.onInit();
  }

  void cargar() {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          fetchMore();
        }
      },
    );
  }

  void fetchMore() {
    nRepositories += 10;
    update();
    fetchData();
  }
}
