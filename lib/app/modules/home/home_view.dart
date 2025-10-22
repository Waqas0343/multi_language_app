import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
   const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Home')),
      body: Center(
        child: Obx(() => Text(
          'Counter: ${controller.counter}',
          style:  TextStyle(fontSize: 24),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child:  Icon(Icons.add),
      ),
      bottomNavigationBar: navBar(context, 0),
    );
  }

  Widget navBar(BuildContext context, int index) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (i) {
        switch (i) {
          case 0:
            Get.toNamed(Routes.home);
            break;
          case 1:
            Get.toNamed(Routes.profile);
            break;
          case 2:
            Get.toNamed(Routes.settings);
            break;
        }
      },
      items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
