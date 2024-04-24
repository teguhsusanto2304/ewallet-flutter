import 'package:flutter/material.dart';
import 'package:myewallet/screens/ewallet_topup/ewallet_topup_screen.dart';
import 'package:myewallet/screens/transfer/transfer_screen.dart';

import '../../../size_config.dart';

class BalanceBanner extends StatelessWidget {
  const BalanceBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90, // Optional, you can keep it or remove it
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row( // Wrap Text and ElevatedButton in a Row
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items horizontally
        children: [
          Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(text: "Ewallet Balance\n"),
                TextSpan(
                  text: "Rp. 123.000.00",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
          ,
          Column(
            mainAxisSize: MainAxisSize.min, // Restrict column size to its content
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, EwalletTopUpBalanceScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, // Set text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Top Up'),
              ),
              const SizedBox(height: 10.0), // Add spacing between buttons (optional)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, TransferScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.orange[500], // Set text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Transfer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
