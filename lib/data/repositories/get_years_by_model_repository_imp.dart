import '../../domain/entities/year_model_entity.dart';
import '../../domain/repositories/get_years_by_model_repository.dart';
import '../datasources/get_years_by_model_remote_datasource.dart';

class GetYearsByModelRepositoryImp implements GetYearsByModelRepository {
  final GetYearsByModelRemoteDatasource _datasource;
  GetYearsByModelRepositoryImp(this._datasource);

  @override
  Future<List<YearModelEntity>> getYearsByModel(
      String vehicleType, String brandCode, String modelCode) async {
    return await _datasource.getYearsByModel(vehicleType, brandCode, modelCode);
  }
}
