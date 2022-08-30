import '../entities/year_model_entity.dart';
import '../repositories/get_years_by_brand_repository.dart';

abstract class GetYearsByBrandUsecase {
  Future<List<YearModelEntity>> getYearsByModel(
      String vehicleType, String codeBrand);
}

class GetYearsByBrandUsecaseImp implements GetYearsByBrandUsecase {
  final GetYearsByBrandRepository _repository;
  GetYearsByBrandUsecaseImp(this._repository);

  @override
  Future<List<YearModelEntity>> getYearsByModel(
      String vehicleType, String codeBrand) async {
    return await _repository.getYearsByBrand(vehicleType, codeBrand);
  }
}
