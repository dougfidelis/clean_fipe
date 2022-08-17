import '../../domain/entities/brand_entity.dart';

abstract class GetBrandsByVehicleTypeRemoteDatasource {
  Future<List<BrandEntity>> getBrandsByVehicleType(String vehicleType);
}
