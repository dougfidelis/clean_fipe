import '../entities/year_model_entity.dart';
import '../repositories/get_years_by_model_repository.dart';

abstract class GetYearsByModelUsecase {
  Future<List<YearModelEntity>> getYearsByModel(
      String vehicleType, String brandCode, String modelCode);
}

class GetYearsByModelUsecaseImp implements GetYearsByModelUsecase {
  final GetYearsByModelRepository _repository;
  GetYearsByModelUsecaseImp(this._repository);

  @override
  Future<List<YearModelEntity>> getYearsByModel(
      String vehicleType, String brandCode, String modelCode) async {
    return await _repository.getYearsByModel(vehicleType, brandCode, modelCode);
  }
}
