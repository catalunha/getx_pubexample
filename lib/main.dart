import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
      GetMaterialApp(
        home: Home(),
        getPages: [
          GetPage(
            name: '/',
            page: () => Home(),
            binding: HomeBinding(),
          ),
        ],
      ),
    );

class CountController extends GetxController {
  static CountController get found => Get.find(); // adicione esta linha

  var count = 0;
  void increment() {
    count++;
    update();
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountController>(() => CountController());
  }
}

class Home extends StatelessWidget {
  final controller = Get.put(CountController());
  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountController>(
              // init: CountController(),
              builder: (controller) => Text(
                'clicks: ${controller.count}',
              ),
            ),
            ElevatedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.to(() => Second());
              },
            ),
          ],
        ),
      ),

      floatingActionButton: GetBuilder<CountController>(
        // init: Controller(),
        builder: (controller) => FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => controller.increment(),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () => controller.increment(),
      // ),
    );
  }
}

class Second extends StatelessWidget {
  // final Controller ctrl = Get.find();
  @override
  Widget build(context) {
    return Scaffold(
        body: Center(child: Text("${CountController.found.count}")));
  }
}
