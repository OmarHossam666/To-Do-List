import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.drawerKey});
  
  final GlobalKey<SliderDrawerState> drawerKey;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isDrawerOpen = false;

  void onDrawerToggle() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;

      if (isDrawerOpen) {
        animationController.forward();
        widget.drawerKey.currentState?.openSlider();
      }
      else {
        animationController.reverse();
        widget.drawerKey.currentState?.closeSlider();
      }
    });
  }

  @override void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(Object context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(onPressed: onDrawerToggle,
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close, 
              progress: animationController,
              size: 40,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(onPressed: onDrawerToggle,
            icon: const Icon(
              Icons.delete_sharp,
              size: 40,
              )
            ),
          ),
        ],),
      ),
    );
  }
}