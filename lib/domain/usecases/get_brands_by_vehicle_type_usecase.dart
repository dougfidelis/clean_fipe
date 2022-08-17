import '../entities/brand_entity.dart';
import '../repositories/get_brands_by_vehicle_type_repository.dart';

abstract class GetBrandsByVehicleTypeUsecase {
  Future<List<BrandEntity>> getBrandsByVehicleType(String vehicleType);
}

class GetBrandsByVehicleTypeUsecaseImp
    implements GetBrandsByVehicleTypeUsecase {
  final GetBrandsByVehicleTypeRepository _repository;
  GetBrandsByVehicleTypeUsecaseImp(this._repository);

  @override
  Future<List<BrandEntity>> getBrandsByVehicleType(String vehicleType) async {
    return await _repository.getBrandsByVehicleType(vehicleType);
  }
}
