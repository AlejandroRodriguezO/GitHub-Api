import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_clone/presentation/home/controllers/home.controller.dart';
import 'package:git_clone/presentation/local.dart';
import 'package:git_clone/presentation/utils.dart';

import '../../local.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Perfil'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  final data = userData[index];
                  return Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CircleAvatar(
                                  radius: responsive.ip(7),
                                  child: Image.network(data.avatarUrl!),
                                ),
                              ),
                              SizedBox(
                                height: responsive.ip(1),
                              ),
                              Text(
                                data.login!,
                                style: TextStyle(
                                    fontSize: responsive.ip(2),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                data.email!,
                                style: TextStyle(
                                    fontSize: responsive.ip(1.5),
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: responsive.ip(2),
                              ),
                              Text(
                                data.bio!,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: responsive.ip(1.7)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    
                      // ListTile(
                      //   title: Text(
                      //     'Dark Mode',
                      //     style: TextStyle(fontSize: responsive.ip(2)),
                      //   ),
                      //   trailing: CupertinoSwitch(
                      //       value: Get.isDarkMode,
                      //       onChanged: (_) => controller.theme.toggle()),
                      // ),
                    
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
