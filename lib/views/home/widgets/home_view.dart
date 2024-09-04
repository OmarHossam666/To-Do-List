import 'package:prodigy_ad_02/views/home/components/home_app_bar.dart';
import 'package:prodigy_ad_02/views/home/components/slider_drawer.dart';
import 'package:prodigy_ad_02/views/home/components/task_view_button.dart';
import 'package:flutter/material.dart';
import 'package:prodigy_ad_02/views/home/widgets/home_widget.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<int> lists = [];
  final drawerKey = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: const TaskViewButton(),
      body: SliderDrawer(
        key: drawerKey,
        isDraggable: false,
        animationDuration: 1000,
        slider: CustomDrawer(),
        appBar: HomeAppBar(drawerKey: drawerKey),
        child: HomeWidget(textTheme: textTheme, lists: lists)
        ),
    );
  }
}