import 'package:clean_fipe/domain/entities/model_entity.dart';
import 'package:clean_fipe/domain/repositories/get_models_by_brand_repository.dart';

abstract class GetModelsByBrandUsecase {
  Future<List<ModelEntity>> getBrandsByVehicleType(
      String vehicleType, String brandName, String yearCode);
}


class GetModelsByBrandUsecaseImp implements GetModelsByBrandUsecase{
  final GetModelsByBrandRepository _repository;
  GetModelsByBrandUsecaseImp(this._repository);

  @override
  Future<List<ModelEntity>> getBrandsByVehicleType(String vehicleType, String brandName, String yearCode) async {
   return await _repository.getModelsbyBrand(vehicleType, brandName, yearCode);
  }
  
}