import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../riverpod/brands_riverpod/brands_provider.dart';
import '../../../../riverpod/fipe_info_riverpod/fipe_info_provider.dart';
import '../../../../riverpod/models_riverpod/models_provider.dart';
import '../../../../riverpod/years_model_riverpod/year_model_provider.dart';
import '../../../brand_page.dart';

class VehicleTypeButton extends HookConsumerWidget {
  final String type;
  final String name;
  const VehicleTypeButton(
    this.type,
    this.name, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ic = ref.watch(brandsNotifierProvider);
    return MaterialButton(
      onPressed: () async {
        await ref
            .read(brandsNotifierProvider.notifier)
            .getBrandsByVehicleType(type);
        ref.read(fipeInfoNotifierProvider.notifier).getFipeInfo('', '', '', '');
        ref
            .read(yearModelNotifierProvider.notifier)
            .getYearsByModel('', '', '');

        ref.read(modelsNotifierProvider.notifier).getModelsByBrand('', '');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BrandPage(type, name),
          ),
        );
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              replacement: CircularProgressIndicator(),
              visible: ic.isEmpty,
              child: const Icon(Icons.add)),
            Text(
              name,
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
