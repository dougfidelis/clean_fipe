
import 'package:clean_fipe/domain/entities/year_model_entity.dart';

abstract class GetYearsByBrandRemoteDatasource {
  Future<List<YearModelEntity>> getYearsByBrand(
      String vehicleType, String codeBrand);
}