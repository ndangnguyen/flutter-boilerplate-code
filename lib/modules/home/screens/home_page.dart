import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petdemo/modules/home/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.k08081C,
      body: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
      // bottomNavigationBar: const HomeBottomBar(),
    );
  }
}
