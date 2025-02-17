import 'package:get/get.dart';
import '../views/input_screen.dart';
import '../views/result_screen.dart';

class AppPages {
  static const initial = '/';

  static final routes = [
    GetPage(name: '/', page: () => InputScreen()),
    GetPage(name: '/result', page: () => ResultScreen()),
  ];
}
