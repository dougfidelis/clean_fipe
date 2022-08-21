import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/model_entity.dart';
import '../../../domain/usecases/get_models_by_brand_usecase.dart';

class ModelsNotifier extends StateNotifier<List<ModelEntity>> {
  final GetModelsByBrandUsecase _usecase;
  ModelsNotifier(this._usecase) : super([]);

  Future<void> getModelsByBrand(String vehicleType, String brandName) async {
    state = [];
    state = await _usecase.getBrandsByVehicleType(vehicleType, brandName);
  }
}
