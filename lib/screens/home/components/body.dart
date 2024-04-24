import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../mydata.dart';
import '../../../size_config.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MyData>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            SizedBox(height: getProportionateScreenWidth(30)),

          ],
        ),
      ),
    );
  }
}
