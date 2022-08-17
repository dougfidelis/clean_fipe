import 'package:clean_fipe/domain/entities/brand_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/get_brands_by_vehicle_type_usecase.dart';

class BrandsNotifier extends StateNotifier<List<BrandEntity>> {
  final GetBrandsByVehicleTypeUsecase _usecase;
  BrandsNotifier(this._usecase) : super([]) {
    getBrandsByVehicleType('carros');
  }

  Future<void> getBrandsByVehicleType(String vehicleType) async {
    state = [];
    await Future.delayed(const Duration(seconds: 5));
    state = await _usecase.getBrandsByVehicleType(vehicleType);
  }
}
