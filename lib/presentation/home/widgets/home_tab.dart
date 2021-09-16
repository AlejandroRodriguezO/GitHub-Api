import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_clone/presentation/details/details_repository.dart';
import 'package:git_clone/presentation/home/controllers/home.controller.dart';
import 'package:git_clone/presentation/local.dart';

class HomeTab extends GetWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Repositorios'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            controller: _.scrollController,
            itemBuilder: (context, index) {
              final data = projectsData[index];

              return ListTile(
                  onTap: () => Get.to(
                      DetailsPage(
                        id: data.id!,
                        name: data.name!,
                        description: data.description,
                        createAd: data.createdAt.toString(),
                        issues: data.issues!.nodes,
                      ),
                      fullscreenDialog: true),
                  title: Text(data.name!),
                  trailing: IconButton(
                    onPressed: () => data.viewerHasStarred!
                        ? _.deleteStar(data.id!)
                        : _.addStar(data.id!),
                    icon: data.viewerHasStarred!
                        ? Icon(
                            Icons.star_rate,
                            color: Colors.amber,
                          )
                        : Icon(Icons.star_border_outlined),
                  ));
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: projectsData.length,
          ),
        ),
      ),
    );
  }
}
