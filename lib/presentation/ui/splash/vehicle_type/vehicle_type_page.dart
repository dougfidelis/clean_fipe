import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/vehicle_type_button.dart';

class VehiclePage extends HookConsumerWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(122, 203, 188, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Divider(),
              VehicleTypeButton('motos', 'Motos'),
              Divider(),
              VehicleTypeButton('carros', 'Carros'),
              Divider(),
              VehicleTypeButton('caminhoes', 'Caminhões'),
              Divider(),
              
            ],
            
          ),
        ),
      ),
    );
  }
}

