import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
   const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Profile')),
      body: Center(
        child: Obx(() => Text(
          'Welcome, ${controller.username}',
          style:  TextStyle(fontSize: 22),
        )),
      ),
      bottomNavigationBar: navBar(context, 1),
    );
  }

  Widget navBar(BuildContext context, int index) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (i) {
        switch (i) {
          case 0:
            Get.offAllNamed(Routes.home);
            break;
          case 1:
            Get.offAllNamed(Routes.profile);
            break;
          case 2:
            Get.offAllNamed(Routes.settings);
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
