import 'package:clean_fipe/data/datasources/get_brands_by_vehicle_type_remote_datasource.dart';
import 'package:clean_fipe/domain/entities/brand_entity.dart';
import 'package:clean_fipe/domain/repositories/get_brands_by_vehicle_type_repository.dart';

class GetBrandsByVehicleTypeRepositoryImp
    implements GetBrandsByVehicleTypeRepository {
  final GetBrandsByVehicleTypeRemoteDatasource _datasource;
  GetBrandsByVehicleTypeRepositoryImp(this._datasource);

  @override
  Future<List<BrandEntity>> getBrandsByVehicleType(String vehicleType) async {
    return await _datasource.getBrandsByVehicleType(vehicleType);
  }
}
