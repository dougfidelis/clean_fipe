import 'package:clean_fipe/presentation/riverpod/brands_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BrandPage extends HookConsumerWidget {
  const BrandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brands = ref.watch(brandsNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(brandsNotifierProvider.notifier)
                        .getBrandsByVehicleType('motos');
                  },
                  child: Text('Motos')),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(brandsNotifierProvider.notifier)
                        .getBrandsByVehicleType('carros');
                  },
                  child: Text('Carros')),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(brandsNotifierProvider.notifier)
                        .getBrandsByVehicleType('caminhoes');
                  },
                  child: Text('Caminhões')),
              Visibility(
                  visible: brands.isNotEmpty,
                  replacement: CircularProgressIndicator(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: brands.length,
                    itemBuilder: (context, index) =>
                        Text(brands[index].brandName),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
