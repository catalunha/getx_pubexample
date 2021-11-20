import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
      GetMaterialApp(
        home: Home(),
      ),
    );

class Controller extends GetxController {
  var count = 0;
  void increment() {
    count++;
    update();
  }
}

class Home extends StatelessWidget {
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
                builder: (_) => Text(
                      'clicks: ${controller.count}',
                    )),
            ElevatedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.to(() => Second());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => controller.increment(),
      ),
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
