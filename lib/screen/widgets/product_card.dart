import 'package:alab/common/custom_text.dart';
import 'package:alab/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget productCard() {
  return Container(
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          color: Colors.grey.shade500,
          spreadRadius: 0.5,
          blurRadius: 5,
          offset: const Offset(0.4, 0.4)),
      const BoxShadow(
          color: Colors.white,
          spreadRadius: 10,
          blurRadius: 5,
          offset: Offset(-0.1, -0.1))
    ]),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 135,
                width: 110,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset: const Offset(0.4, 0.4)),
                      const BoxShadow(
                          color: Colors.white,
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset: Offset(-0.4, -0.1))
                    ],
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/cake_img.jpg"),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => Get.find<HomeController>().addToFav(),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: GetBuilder<HomeController>(builder: (controller) {
                      return Icon(
                        controller.isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: controller.isFav ? Colors.red : Colors.white,
                        size: 18,
                      );
                    }),
                  ),
                ),
              ),
              const Positioned(
                  bottom: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "FLAT DEAL",
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: "₹125 OFF",
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                        CustomText(
                          text: "ABOVE₹199",
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                  const CustomText(
                    text: "Cake Trends",
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const CustomText(
                          text: "4.1 (140) 40-45 mins", fontSize: 12),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            color: Colors.purple, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.cake_rounded,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const CustomText(
                          text: "Perfect Cake Delivery", fontSize: 12)
                    ],
                  ),
                  const SizedBox(height: 4),
                  const CustomText(
                    text: "Bakery, Cakes and pastrie...",
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  const CustomText(
                      text: "Padapai 3.0 km", color: Colors.grey, fontSize: 12),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
