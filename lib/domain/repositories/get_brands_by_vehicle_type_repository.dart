import '../entities/brand_entity.dart';

abstract class GetBrandsByVehicleTypeRepository {
  Future<List<BrandEntity>> getBrandsByVehicleType(String vehicleType);
}
