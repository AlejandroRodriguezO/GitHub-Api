import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_clone/presentation/login/controller/login_controller.dart';
import 'package:git_clone/presentation/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final responsive = Responsive.of(context);
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                      padding: const EdgeInsets.all(30),
                      width: responsive.width,
                      height:responsive.height,
                      color: Colors.black,
                      child: Column(
              children: [
                SizedBox(
                  width: responsive.ip(15),
                  height: responsive.ip(15),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/github.jpg'),
                  ),
                ),
                 Text(
                  "Github",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.ip(7),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: responsive.ip(8),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(.1)),
                  child: TextField(
                    onChanged: (value) {},
                    controller: _.ctrlUsername,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Github username",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: responsive.ip(2),
                ),
                MaterialButton(
                  onPressed: () => _.fetchData(),
                  padding: const EdgeInsets.all(20),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Continuar',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
                      ),
                    ),
            ));
      },
    );
  }
}
