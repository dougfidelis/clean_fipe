import '../../domain/entities/year_model_entity.dart';
import '../../domain/repositories/get_years_by_brand_repository.dart';
import '../datasources/get_years_by_brand_remote_datasource.dart';

class GetYearsByBrandRepositoryImp implements GetYearsByBrandRepository {
  final GetYearsByBrandRemoteDatasource _datasource;
  GetYearsByBrandRepositoryImp(this._datasource);

  @override
  Future<List<YearModelEntity>> getYearsByBrand(
      String vehicleType, String brandCode) async {
    return await _datasource.getYearsByBrand(vehicleType, brandCode,);
  }
}
