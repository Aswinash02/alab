import 'package:alab/common/custom_text.dart';
import 'package:alab/controllers/home_controller.dart';
import 'package:alab/screen/widgets/exist_dialog.dart';
import 'package:alab/screen/widgets/product_card.dart';
import 'package:alab/screen/widgets/rate_card.dart';
import 'package:alab/screen/widgets/sign_out_dailog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Get.find<HomeController>().fetchUserName();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await exitDialog();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const CustomText(text: "Home Screen"),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  signOutDialog();
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.power_settings_new,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: "Welcome to Alab!",
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  color: Colors.orange,
                ),
                const SizedBox(height: 10),
                GetBuilder<HomeController>(builder: (controller) {
                  return CustomText(
                      text: "${controller.userName?.toUpperCase()}");
                }),
                const SizedBox(height: 20),
                productCard(),
                const SizedBox(height: 20),
                const RateCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
