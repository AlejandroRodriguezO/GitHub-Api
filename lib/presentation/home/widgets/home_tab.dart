import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_clone/presentation/home/controllers/home.controller.dart';
import 'package:git_clone/presentation/local.dart';
import 'package:git_clone/presentation/utils.dart';

class HomeTab extends GetWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Repositorios'),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                controller: _.scrollController,
                itemBuilder: (context, index) {
                  final data = projectsData[index];
                  if (index < projectsData.length) {
                    return ListTile(
                      title: Text('${data.name}'),
                      trailing: data.viewerHasStarred!
                          ? Icon(
                              Icons.star_rate,
                              color: Colors.amber,
                            )
                          : Icon(Icons.star_border_outlined),
                    );
                  } else {
                    return Container(
                      height: kToolbarHeight,
                      width: responsive.width,
                      child: Center(
                        child: Text('No hay mas datos'),
                      ),
                    );
                  }
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: projectsData.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
