import 'package:clean_fipe/domain/entities/model_entity.dart';
import 'package:clean_fipe/domain/usecases/get_models_by_brand_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModelsNofier extends StateNotifier<List<ModelEntity>> {
  final GetModelsByBrandUsecase _usecase;
  ModelsNofier(this._usecase) : super([]);

  Future<void> getModelsByBrand(String vehicleType, String brandName) async {
    state = [];
    state = await _usecase.getBrandsByVehicleType(vehicleType, brandName);
  }

  Future<void> clearList() async {
    state = [];
  }
}
