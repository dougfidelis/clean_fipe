import 'package:clean_fipe/presentation/riverpod/fipe_info_riverpod/fipe_info_provider.dart';
import 'package:clean_fipe/presentation/riverpod/years_model_riverpod/year_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../riverpod/brands_riverpod/brands_provider.dart';
import '../riverpod/models_riverpod/models_provider.dart';

final codeBrandProvider = StateProvider<String>(
  (ref) => '',
);
final codeModelProvider = StateProvider<String>(
  (ref) => '',
);

class BrandPage extends HookConsumerWidget {
  const BrandPage(this.vehicleType, {Key? key}) : super(key: key);
  final String vehicleType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brands = ref.watch(brandsNotifierProvider);
    final models = ref.watch(modelsNotifierProvider);
    final years = ref.watch(yearModelNotifierProvider);
    final fipeInfo = ref.watch(fipeInfoNotifierProvider);
    String? brandCode;
    String? brandName;
    String? modelName;
    String? modelCode;
    String? codeBrandProv = ref.watch(codeBrandProvider);
    String? codeModelProv = ref.watch(codeModelProvider);
    String? yearName;
    String? yearCode;
    return Scaffold(
      appBar: AppBar(
        title: Text(vehicleType),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Visibility(
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
                          debugPrint('$vehicleType 1=> $brandCode');
                          ref
                              .read(yearModelNotifierProvider.notifier)
                              .getYearsByModel(vehicleType, '', '');

                          ref
                              .read(modelsNotifierProvider.notifier)
                              .getModelsByBrand(vehicleType, (brandCode) ?? '');
                          break;
                        }
                      }
                      ref.watch(codeBrandProvider.state).state = brandCode!;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: models.isNotEmpty,
                    replacement: const Center(child: Text('Selecione a marca')),
                    child: DropdownButtonFormField(
                      onTap: (() {
                        print(codeBrandProv);
                      }),
                      isExpanded: true,
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
                              child: Text(
                                models.name,
                                overflow: TextOverflow.ellipsis,
                              ),
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
                          if (model.name == modelName) {
                            modelCode = model.code;
                            //codeModelProv = modelCode!;
                            debugPrint(
                                'type: $vehicleType -- brandId: $brandCode -- modelId: $modelCode');
                            ref
                                .read(yearModelNotifierProvider.notifier)
                                .getYearsByModel(
                                    vehicleType, codeBrandProv!, modelCode!);
                            break;
                          }
                        }
                        ref.watch(codeModelProvider.state).state = modelCode!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: years.isNotEmpty,
                    replacement: const Center(child: Text('')),
                    child: DropdownButtonFormField(
                      isExpanded: true,
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
                      items: years
                          .map(
                            (years) => DropdownMenuItem<String>(
                              value: years.name,
                              child: Text(
                                years.name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      value: yearName,
                      hint: const Text(
                        'Selecione o Ano',
                        style: TextStyle(color: Colors.black45),
                      ),
                      onChanged: (value) {
                        yearName = value.toString();
                        for (var year in years) {
                          if (year.name == yearName) {
                            yearCode = year.code;

                            //vehicleType, brandCode, modelCode, yearCode

                            debugPrint(
                                'final type: $vehicleType -- brandId: $codeBrandProv -- modelId: $codeModelProv -- $yearCode');

                            ref
                                .read(fipeInfoNotifierProvider.notifier)
                                .getFipeInfo(vehicleType, codeBrandProv!,
                                    codeModelProv!, yearCode!);
                            //     .getYearsByModel(
                            //         vehicleType, codeY!, modelCode!);
                            break;
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
                visible: fipeInfo.isNotEmpty,
                replacement: Text(''),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(fipeInfo[index].brand),
                        Text(fipeInfo[index].model),
                        Text(fipeInfo[index].modelYear.toString()),
                        Text(fipeInfo[index].codeFipe),
                        Text(fipeInfo[index].referenceMonth),
                        Text(fipeInfo[index].price),
                      ],
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
