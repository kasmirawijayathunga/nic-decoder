import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import '../widgets/info_card.dart';
import '../widgets/footer.dart';

class ResultScreen extends StatelessWidget {
  final NICController controller = Get.find<NICController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NIC Details")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoCard(title: "NIC Type", value: controller.nicType.value),
                  InfoCard(
                      title: "Date of Birth",
                      value: controller.birthDate.value),
                  InfoCard(
                      title: "Day of the Week",
                      value: controller.weekDay.value),
                  InfoCard(title: "Age", value: controller.age.value),
                  InfoCard(title: "Gender", value: controller.gender.value),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Go Back"),
                  ),
                ],
              ),
            ),
          ),
          const Footer(), // Footer at bottom
        ],
      ),
    );
  }
}
