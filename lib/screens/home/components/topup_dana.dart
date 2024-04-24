import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../mydata.dart';
import '../../../size_config.dart';

class TopUpDana extends StatelessWidget {
  const TopUpDana({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MyData>(context);
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Colors.green[500],
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "Top Up DANA\n"),
          ],
        ),
      ),
    );
  }
}
