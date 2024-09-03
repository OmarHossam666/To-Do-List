import 'package:prodigy_ad_02/views/home/components/task_view_button.dart';
import 'package:flutter/material.dart';
import 'package:prodigy_ad_02/views/home/widgets/home_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<int> lists = [];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: const TaskViewButton(),
      body: HomeWidget(textTheme: textTheme, lists: lists),
    );
  }
}