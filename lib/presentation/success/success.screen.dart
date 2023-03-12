import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/success.controller.dart';

class SuccessScreen extends GetView<SuccessController> {
  const SuccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SuccessScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SuccessScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
