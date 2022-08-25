import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/vehicle_type_button.dart';

class VehiclePage extends HookConsumerWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(122, 203, 188, 1),
      body: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 58, 73, 117),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(height: 20,),
                VehicleTypeButton('carros', 'Carros'),
                SizedBox(height: 20,),
                VehicleTypeButton('motos', 'Motos'),
                SizedBox(height: 20,),
                VehicleTypeButton('caminhoes', 'Caminhões'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
