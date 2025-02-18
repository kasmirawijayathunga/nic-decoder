import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NICController extends GetxController {
  var nicNumber = ''.obs;
  var birthDate = ''.obs;
  var gender = ''.obs;
  var age = ''.obs;
  var weekDay = ''.obs;
  var nicType = ''.obs;

  void decodeNIC(String nic) {
    if (nic.length == 10 || nic.length == 12) {
      nicType.value = nic.length == 10 ? "Old NIC" : "New NIC";
      String year =
          nic.length == 10 ? "19${nic.substring(0, 2)}" : nic.substring(0, 4);
      int days = int.parse(
          nic.substring(nic.length == 10 ? 2 : 4, nic.length == 10 ? 5 : 7));
      String serial =
          nic.substring(nic.length == 10 ? 5 : 7, nic.length == 10 ? 9 : 12);
      bool isMale = days < 500;

      if (!isMale) days -= 500;

      int leapYearFix = int.parse(year) / 4 == 0 ? 0 : 1;
      DateTime dob = DateTime(int.parse(year), 1, 1)
          .add(Duration(days: days - 1 - leapYearFix));
      String formattedDate = DateFormat('MMMM d, yyyy').format(dob);
      String dayOfWeek = DateFormat('EEEE').format(dob);

      int currentYear = DateTime.now().year;
      int calculatedAge = currentYear - int.parse(year);

      birthDate.value = formattedDate;
      gender.value = isMale ? "Male" : "Female";
      age.value = "$calculatedAge years";
      weekDay.value = dayOfWeek;

      Get.toNamed('/result');
    } else {
      Get.snackbar(
        "Invalid NIC",
        "Please enter a valid 10 or 12-digit NIC number.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
      );
    }
  }
}
