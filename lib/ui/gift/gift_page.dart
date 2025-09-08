import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './viewmodel/gift_viewmodel.dart';

class GiftPage extends GetWidget<GiftViewModel> {
  const GiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('GiftPage'),
        ],
      ),
    );
  }
}