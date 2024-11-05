import 'dart:async';

import 'package:alab/common/custom_text.dart';
import 'package:alab/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RateCard extends StatefulWidget {
  const RateCard({super.key});

  @override
  State<RateCard> createState() => _RateCardState();
}

class _RateCardState extends State<RateCard> {
  bool _isScooterOnLeft = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimationTimer();
  }

  void _startAnimationTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _isScooterOnLeft = !_isScooterOnLeft;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Row(
            children: [
              CustomText(
                text: "Thank you for adding a Tip!",
                color: Colors.black54,
              ),
              SizedBox(width: 4),
              Icon(
                Icons.info_outlined,
                color: Colors.grey,
                size: 15,
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: CustomText(
                        text:
                            "You've made their day! 100% of the tip will go to your "
                            "delivery partner for this and future orders.",
                        maxLines: 3,
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                left: _isScooterOnLeft ? 0 : 60,
                                child: Image.asset(
                                  "assets/images/scooter_img.png",
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0;
                        i < Get.find<HomeController>().price.length;
                        i++)
                      GestureDetector(
                          onTap: () =>
                              Get.find<HomeController>().selectedPrice(i),
                          child: rateContainer(i)),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                Row(
                  children: [
                    GetBuilder<HomeController>(builder: (controller) {
                      return Checkbox(
                        value: controller.isChecked,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Colors.orange,
                        onChanged: (bool? value) =>
                            controller.onChangeCheckBox(),
                      );
                    }),
                    const CustomText(
                      text: "Add this tip automatically to future orders",
                      color: Colors.black54,
                      fontSize: 13,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget rateContainer(int i) {
  return GetBuilder<HomeController>(builder: (controller) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      decoration: BoxDecoration(
          color: i == Get.find<HomeController>().isSelectedPrice
              ? Colors.orange.shade100
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: i == Get.find<HomeController>().isSelectedPrice
                  ? Colors.orange
                  : Colors.grey)),
      child: Row(
        children: [
          CustomText(
            text: i == 3
                ? Get.find<HomeController>().price[i]
                : "₹${Get.find<HomeController>().price[i]}",
            fontSize: 14,
          ),
          i == Get.find<HomeController>().isSelectedPrice
              ? const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Icon(
                    Icons.cancel,
                    color: Colors.orange,
                    size: 15,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  });
}
