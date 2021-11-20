import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
      GetMaterialApp(
        home: HomeConnector(),
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

class HomeConnector extends StatelessWidget {
  final controller = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountController>(
      builder: (controller) => HomeUI(
        count: controller.count,
        increment: controller.increment,
      ),
    );
  }
}

class HomeUI extends StatelessWidget {
  final int count;
  final VoidCallback increment;
  const HomeUI({
    Key? key,
    required this.count,
    required this.increment,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('clicks: $count'),
            ElevatedButton(
              child: const Text('Next Route'),
              onPressed: () {
                Get.to(() => SecondConnector());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => increment(),
      ),
    );
  }
}

class SecondConnector extends StatelessWidget {
  // final Controller ctrl = Get.find();
  @override
  Widget build(context) {
    return SecondUI(
      count: CountController.found.count,
    );
  }
}

class SecondUI extends StatelessWidget {
  final int count;

  const SecondUI({
    Key? key,
    required this.count,
  }) : super(key: key);
  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("$count")));
  }
}
