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
    Color beige = Colors.white;
    return MaterialButton(
      onPressed: () {
        ref.read(brandsNotifierProvider.notifier).getBrandsByVehicleType(type);
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          type == 'carros'
              ?  Icon(Icons.directions_car, color: beige,)
              : type == 'motos'
                  ? Icon(Icons.two_wheeler, color: beige,)
                  :  Icon(Icons.local_shipping, color: beige),
          Text(
            name,
            style:  TextStyle(fontSize: 30, color: beige, fontWeight: FontWeight.w300,),
          ),
        ],
      ),
    );
  }
}
