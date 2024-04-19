import 'package:painel_hortifrutti/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_widget_controller.dart';
import 'package:painel_hortifrutti/app/modules/product/widgets/quantity_and_weight/quantity_widget.dart';
import 'package:painel_hortifrutti/app/modules/product/widgets/quantity_and_weight/weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityAndWeightWidget extends StatelessWidget {
  final bool isKg;
  const QuantityAndWeightWidget({super.key, this.isKg = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
      init: QuantityAndWeightController(isKg: isKg),
      builder: (controller) {
        return Column(
          children: [QuantityWidget(), WeightWidget()],
        );
      },
    );
  }
}
