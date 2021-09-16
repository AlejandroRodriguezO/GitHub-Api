import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_clone/infrastructure/model/repo_model.dart';
import 'package:git_clone/presentation/home/controllers/home.controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.id,
    required this.name,
    this.description,
    required this.createAd,
    this.issues,
  }) : super(key: key);

  final String id;
  final String name;
  final String? description;
  final String? createAd;
  final List<IssuesNode>? issues;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.dialog(
              AlertDialog(
                title: Text('Nuevo Issue'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _.ctrlIssueName,
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                        ),
                      ),
                      TextFormField(
                        controller: _.ctrlIssueDesc,
                        decoration: InputDecoration(
                          labelText: 'Descripción',
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (_.ctrlIssueName.text.isNotEmpty &&
                          _.ctrlIssueDesc.text.isNotEmpty) {
                        _.createIssue(id);
                        _.ctrlIssueName.clear();
                        _.ctrlIssueDesc.clear();
                        Get.back();
                      }
                    },
                    child: Text('Crear'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                      _.ctrlIssueName.clear();
                      _.ctrlIssueDesc.clear();
                    },
                    child: Text('Cancelar'),
                  ),
                ],
              ),
            );
          },
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('Descripción'),
              subtitle: Text(description ?? 'no hay descripcion'),
            ),
            ListTile(
              title: Text('Creado:'),
              subtitle: Text(createAd!),
            ),
            ...List.generate(issues!.length, (index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CircleAvatar(
                    child: Image.network(issues![index].author!.avatarUrl!),
                  ),
                ),
                title: Text(issues![index].title ?? 'No hay Issues'),
                subtitle: Text(issues![index].body ?? 'No hay Descripcion'),
              );
            })
          ],
        ),
      ),
    );
  }
}
