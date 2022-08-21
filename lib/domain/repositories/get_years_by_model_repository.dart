import 'package:clean_fipe/domain/entities/year_model_entity.dart';

abstract class GetYearsByModelRepository {
  Future<List<YearModelEntity>> getYearsByModel(
      String vehicleType, String brandCode, String modelCode);
}
