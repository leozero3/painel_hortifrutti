import 'package:painel_hortifrutti/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WeightWidget extends StatelessWidget {
  final controller = Get.find<QuantityAndWeightController>();

  WeightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${NumberFormat.decimalPattern().format(controller.min)}Kg',
          style: Get.textTheme.labelSmall,
        ),
        Expanded(
          child: GestureDetector(
            onTapDown: (details) => controller.enableSlider(),
            child: Slider(
              min: controller.min,
              max: controller.max,
              divisions: 19,
              label: controller.label,
              value: controller.weight,
              onChanged: (value) {
                if (controller.sliderEnable.isTrue) {
                  controller.changeWeight(value);
                }
              },
            ),
          ),
        ),
        Text(
          '${NumberFormat.decimalPattern().format(controller.max)}Kg',
          style: Get.textTheme.labelSmall,
        ),
      ],
    );
  }
}