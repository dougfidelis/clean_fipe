import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../riverpod/brands_riverpod/brands_provider.dart';
import '../riverpod/fipe_info_riverpod/fipe_info_provider.dart';
import '../riverpod/models_riverpod/models_provider.dart';
import '../riverpod/years_model_riverpod/year_model_provider.dart';
import 'brand_page.dart';

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
            children: [
              TextButton(                  
                  onPressed: () {
                    ref
                        .read(fipeInfoNotifierProvider.notifier)
                        .getFipeInfo('', '', '', '');
                    ref
                        .read(yearModelNotifierProvider.notifier)
                        .getYearsByModel('', '', '');

                    ref
                        .read(modelsNotifierProvider.notifier)
                        .getModelsByBrand('', '');
                    ref
                        .read(brandsNotifierProvider.notifier)
                        .getBrandsByVehicleType('motos');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BrandPage('motos'),
                      ),
                    );
                  },
                  child: const Text('Motos', style: TextStyle(fontSize: 30),)),
              TextButton(
                  onPressed: () {
                    ref
                        .read(fipeInfoNotifierProvider.notifier)
                        .getFipeInfo('', '', '', '');
                    ref
                        .read(yearModelNotifierProvider.notifier)
                        .getYearsByModel('', '', '');

                    ref
                        .read(modelsNotifierProvider.notifier)
                        .getModelsByBrand('', '');
                    ref
                        .read(brandsNotifierProvider.notifier)
                        .getBrandsByVehicleType('carros');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BrandPage('carros'),
                      ),
                    );
                  },
                  
                  child: const Text('Carros')),
                 const Divider(height: 100, thickness: 2, ),
              TextButton(
                  onPressed: () {
                    ref
                        .read(fipeInfoNotifierProvider.notifier)
                        .getFipeInfo('', '', '', '');
                    ref
                        .read(yearModelNotifierProvider.notifier)
                        .getYearsByModel('', '', '');

                    ref
                        .read(modelsNotifierProvider.notifier)
                        .getModelsByBrand('', '');
                    ref
                        .read(brandsNotifierProvider.notifier)
                        .getBrandsByVehicleType('caminhoes');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BrandPage('caminhoes'),
                      ),
                    );
                  },
                  child: const Text('Caminhões')),
            ],
          ),
        ),
      ),
    );
  }
}
