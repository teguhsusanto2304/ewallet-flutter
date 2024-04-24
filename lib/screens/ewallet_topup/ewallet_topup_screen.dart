import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import '../../constants.dart';
import '../../size_config.dart';

class EwalletTopUpBalanceScreen extends StatefulWidget {
  static String routeName = "/ewallet_topup";
  const EwalletTopUpBalanceScreen({Key? key, }) : super(key: key);

  @override
  _EwalletTopUpBalanceState createState() => _EwalletTopUpBalanceState();
}

class _EwalletTopUpBalanceState extends State<EwalletTopUpBalanceScreen> {
  final _formKey = GlobalKey<FormState>();

  double _topUpAmount = 0.0;
  bool _isProcessing = false; // Flag to indicate ongoing top-up process

  Future<void> _submitTopUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isProcessing = true);
      const success = true;
      setState(() => _isProcessing = false);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Top-up successful')),
        );
        // Update user balance in UI
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Top-up failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up Balance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(fillColor: Colors.white,
                    filled: true,labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
                onChanged: (value) => setState(() => _topUpAmount = double.parse(value)),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              SizedBox(
                width: SizeConfig.screenWidth * 0.9,
                child: SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(56),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: _isProcessing ? null : _submitTopUp,
                    child: _isProcessing ? const CircularProgressIndicator() : const Text('Top Up'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}