import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import '../../constants.dart';
import '../../size_config.dart';

class TransferScreen extends StatefulWidget {
  static String routeName = "/transfer";
  const TransferScreen({Key? key, }) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<TransferScreen> {
  final _formKey = GlobalKey<FormState>();
  String _recipientId = '';
  double _transferAmount = 0.0;
  String _message = '';
  bool _isProcessing = false;

  Future<void> _submitTransfer() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isProcessing = true);
      const success = true;
      setState(() => _isProcessing = false);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transfer successful')),
        );
        // Clear form fields after successful transfer (optional)
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transfer failed')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fund Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(fillColor: Colors.white,
                    filled: true,labelText: 'Recipient Username/ID/Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter recipient information';
                  }
                  return null;
                },
                onChanged: (value) => setState(() => _recipientId = value),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
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
                onChanged: (value) => setState(() => _transferAmount = double.parse(value)),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              TextFormField(
                decoration: const InputDecoration(fillColor: Colors.white,
                    filled: true,labelText: 'Message (Optional)'),
                onChanged: (value) => setState(() => _message = value),
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
                    onPressed: _isProcessing ? null : _submitTransfer,
                    child: _isProcessing ? const CircularProgressIndicator() : const Text('Transfer'),
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