import 'package:clean_fipe/presentation/riverpod/brands_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BrandPage extends HookConsumerWidget {
  const BrandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brands = ref.watch(brandsNotifierProvider);
    String? brandName;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: TextButton.styleFrom(
                          elevation: 20,
                          visualDensity:
                              VisualDensity(horizontal: 1.0, vertical: 1.0),
                          enableFeedback: false),
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
                ],
              ),
              Visibility(
                visible: brands.isNotEmpty,
                replacement: CircularProgressIndicator(),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      label: const Text(
                        'Marca',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  isExpanded: true,
                  items: brands
                      .map(
                        (brand) => DropdownMenuItem<String>(
                          value: brand.brandName,
                          child: Text(brand.brandName),
                        ),
                      )
                      .toList(),
                  value: brandName,
                  onChanged: (value) {
                    brandName = value.toString();
                    for (var brand in brands) {
                      if (brand.brandName == value)
                        print('${brand.brandName} ${brand.codeBrand}');
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
