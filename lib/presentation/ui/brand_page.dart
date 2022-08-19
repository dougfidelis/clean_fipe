import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../riverpod/brands_riverpod/brands_provider.dart';
import '../riverpod/models_riverpod/models_provider.dart';

class BrandPage extends HookConsumerWidget {
  const BrandPage(this.vehicleType, {Key? key}) : super(key: key);
  final String vehicleType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brands = ref.watch(brandsNotifierProvider);
    final models = ref.watch(modelsNotifierProvider);
    String? brandName;
    String? brandCode;
    String? modelName;
    return Scaffold(
      appBar: AppBar(
        title: Text(vehicleType),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Visibility(
          visible: brands.isNotEmpty,
          replacement: const CircularProgressIndicator(),
          child: Column(
            children: [
              DropdownButtonFormField(
                isExpanded: false,
                decoration: InputDecoration(
                  label: const Text(
                    'Marca',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: brands
                    .map(
                      (brand) => DropdownMenuItem<String>(
                        value: brand.brandName,
                        child: Text(brand.brandName),
                      ),
                    )
                    .toList(),
                value: brandName,
                hint: const Text(
                  'Selecione a marca',
                  style: TextStyle(color: Colors.black45),
                ),
                onChanged: (value) {
                  brandName = value.toString();

                  for (var brand in brands) {
                    if (brand.brandName == value) {
                      brandCode = brand.codeBrand;
                      debugPrint('${brand.brandName} ${brand.codeBrand}');

                      debugPrint('$vehicleType $brandCode');
                      ref
                          .read(modelsNotifierProvider.notifier)
                          .getModelsByBrand(vehicleType, (brandCode) ?? '');
                    }
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: models.isNotEmpty,
                replacement: const Center(
                    child: Text('Selecione a marca')),
                child: DropdownButtonFormField(
                  isExpanded: false,
                  decoration: InputDecoration(
                    label: const Text(
                      'Modelo',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: models
                      .map(
                        (models) => DropdownMenuItem<String>(
                          value: models.name,
                          child: Text(models.name),
                        ),
                      )
                      .toList(),
                  value: modelName,
                  hint: const Text(
                    'Selecione o modelo',
                    style: TextStyle(color: Colors.black45),
                  ),
                  onChanged: (value) {
                    modelName = value.toString();
                    for (var model in models) {
                      if (model.name == value) {
                        //TODO teste vericação de codigo marca
                        debugPrint('${model.name} ${model.code}');
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
