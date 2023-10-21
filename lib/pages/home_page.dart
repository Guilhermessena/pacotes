import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pacotes/pages/brasil_fields/brasil_fields_page.dart';
import 'package:pacotes/widgets/menu_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  var posPage = 0;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "APP_TITLE".tr(),
            ),
          ),
          drawer: const MenuDrawer(),
          body: TabBarView(
            controller: tabController,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
              const BrasilFieldsPage(),
            ],
          ),
          bottomNavigationBar: ConvexAppBar.badge(
            const {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
            items: const [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.map, title: 'Discovery'),
              TabItem(icon: Icons.add, title: 'Add'),
              TabItem(icon: Icons.message, title: 'Message'),
              TabItem(icon: Icons.people, title: 'Brasil'),
            ],
            onTap: (int i) => tabController.index = i,
            controller: tabController,
          )),
    );
  }
}
