import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'balance_banner.dart';
import 'dana_balance_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            BalanceBanner(),
            SizedBox(height: getProportionateScreenWidth(2)),
            DanaBalanceBanner(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
