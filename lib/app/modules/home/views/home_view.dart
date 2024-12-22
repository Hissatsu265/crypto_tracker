import 'package:crypto_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => controller.logout(),
          ),
        ],
      ),
      body: Center(
        child: Obx(() => Text(
              'Welcome ${controller.userEmail}',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}