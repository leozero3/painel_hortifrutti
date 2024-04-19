import 'package:flutter/material.dart';
import 'package:painel_hortifrutti/app/data/models/next_status.dart';

import 'package:painel_hortifrutti/app/data/models/order_status_model.dart';

typedef OnChangeStatus = void Function(int statusId);

class OrderNextStatusWidget extends StatelessWidget {
  final OnChangeStatus onChangeStatus;
  final OrderStatusModel currentStatus;
  final nextStatusList = {
    1: [
      NextStatus(2, 'Confirmar'),
      NextStatus(5, 'Recusar', isOk: false),
    ],
    2: [
      NextStatus(3, 'Saiu para entrega'),
      NextStatus(5, 'Cancelar', isOk: false),
    ],
    3: [
      NextStatus(4, 'Entregue'),
      NextStatus(5, 'Cancelar', isOk: false),
    ]
  };

  OrderNextStatusWidget(
    this.currentStatus,
    this.onChangeStatus, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var options = nextStatusList[currentStatus.id];
    if (options == null) {
      return const SizedBox();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var nextStatus in options) ...[
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: () => onChangeStatus(nextStatus.id),
            style: OutlinedButton.styleFrom(
                foregroundColor: nextStatus.isOk ? Colors.green : Colors.red,
                side: BorderSide(
                  color: nextStatus.isOk ? Colors.green : Colors.red,
                )),
            child: Text(nextStatus.text),
          ),
          const SizedBox(width: 10),
        ]
      ],
    );
  }
}
