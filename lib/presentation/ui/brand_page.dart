import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../riverpod/brands_provider.dart';

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
                        borderRadius: BorderRadius.circular(10))),
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
                      //TODO teste vericação de codigo marca
                      debugPrint('${brand.brandName} ${brand.codeBrand}');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
