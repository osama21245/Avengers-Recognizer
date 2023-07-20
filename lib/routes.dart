import 'package:recognizer/screens/home.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const Home(),
  ),
];
