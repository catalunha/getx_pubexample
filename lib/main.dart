import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
      GetMaterialApp(
        home: Home(),
      ),
    );

class Controller extends GetxController {
  // static Controller get to => Get.find(); // adicione esta linha

  var count = 0;
  void increment() {
    count++;
    update();
  }
}

class Home extends StatelessWidget {
  // final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
              init: Controller(),
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
      floatingActionButton: GetBuilder<Controller>(
        // init: Controller(),
        builder: (controller) => FloatingActionButton(
          child: Icon(Icons.add),
          // onPressed: () => Controller.to.increment(),
          // onPressed: () => controller.increment(),
          onPressed: () => controller.increment(),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   // onPressed: () => Controller.to.increment(),
      //   // onPressed: () => controller.increment(),
      //   onPressed: () => GetBuilder<Controller>(
      //     // init: Controller(),
      //     builder: (controller) => controller.increment(),
      //   ),
      // ),
    );
  }
}

class Second extends StatelessWidget {
  final Controller ctrl = Get.find();
  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("${ctrl.count}")));
  }
}
