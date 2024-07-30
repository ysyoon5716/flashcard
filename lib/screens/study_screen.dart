import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/study_controller.dart';

class StudyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StudyController studyController = Get.put(StudyController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Study'),
      ),
      body: Container(
        margin: EdgeInsets.all(36),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Obx(() => Text(
                  studyController.front.value,
                  style: TextStyle(fontSize: 20),
                )),
              )
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  studyController.showBack.toggle();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Obx(() => studyController.showBack.value
                    ? Text(
                      studyController.back.value,
                      style: TextStyle(fontSize: 20),
                    )
                    : Text(''),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await studyController.getRandomCard();
              },
              child: Text('Next Card', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50)
              ),
            ),
          ],
        )
      )
    );
  }
}