import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/footer.dart';

class InputScreen extends StatelessWidget {
  final NICController controller = Get.put(NICController());

  @override
  Widget build(BuildContext context) {
    TextEditingController nicController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("NIC Decoder")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container with maxWidth to limit NIC input length
                  Container(
                    constraints:
                        BoxConstraints(maxWidth: 400), // max width of 400px
                    child: TextField(
                      controller: nicController,
                      decoration: const InputDecoration(
                        labelText: "Enter NIC Number",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      maxLength: 12, // Maximum length of NIC number
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: "Decode",
                    onPressed: () {
                      controller.decodeNIC(nicController.text);
                    },
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
