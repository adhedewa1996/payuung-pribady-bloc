import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/something_controller.dart';

class SomethingView extends GetView<SomethingController> {
  const SomethingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        title: const Text('SOMETHING VIEW'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('SOMETHING VIEW'),
      ),
    );
  }
}
