import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:prodigy_ad_02/extensions/space_extension.dart';
import 'package:prodigy_ad_02/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final List<IconData> icons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.info,
  ];

  final List<String> titles = [
    "Home",
    "Profile",
    "Settings",
    "Details",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          )
      ),
      child: Column(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile_photo.jpg"),
            radius: 50,
            ),
            8.height,
            const Text(
              "Omar Hossam",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 10,
              ),
              width: double.infinity,
              height: 300,
              child: ListView.builder(
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => log("${titles[index]} Item Tapped"),
                    child: ListTile(
                      leading: Icon(
                        icons[index],
                        color: Colors.white,
                        size: 30,
                        ),
                      title: Text(
                        titles[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),
                        ),
                    ),
                  );
                }
                ),
            )
        ],
      ),
    );
  }
}