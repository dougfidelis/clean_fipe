import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../riverpod/brands_riverpod/brands_provider.dart';
import 'brand_page.dart';

class VehiclePage extends HookConsumerWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  style: TextButton.styleFrom(
                      elevation: 20,
                      visualDensity:
                          const VisualDensity(horizontal: 1.0, vertical: 1.0),
                      enableFeedback: false),
                  onPressed: () {
                    ref
                        .read(brandsNotifierProvider.notifier)
                        .getBrandsByVehicleType('motos');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BrandPage('motos'),
                      ),
                    );
                  },
                  child: const Text('Motos')),
              ElevatedButton(
                  onPressed: () {
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
              ElevatedButton(
                  onPressed: () {
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
