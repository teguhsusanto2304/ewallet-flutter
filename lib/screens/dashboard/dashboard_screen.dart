import 'package:flutter/material.dart';
import 'package:myewallet/components/coustom_bottom_nav_bar.dart';
import 'package:myewallet/enums.dart';

import 'components/body.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = "/dashboard";

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
