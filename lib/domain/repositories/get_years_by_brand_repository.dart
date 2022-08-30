import '../entities/year_model_entity.dart';

abstract class GetYearsByBrandRepository {
  Future<List<YearModelEntity>> getYearsByBrand(
      String vehicleType, String codeBrand);
}
