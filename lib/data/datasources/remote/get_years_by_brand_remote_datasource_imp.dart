import 'package:dio/dio.dart';

import '../../../domain/entities/year_model_entity.dart';
import '../../dtos/year_model_dto.dart';
import '../get_years_by_brand_remote_datasource.dart';

class GetYearsByBrandRemoteDatasourceImp
    implements GetYearsByBrandRemoteDatasource {
  final Dio _dio;
  GetYearsByBrandRemoteDatasourceImp(this._dio);

  @override
  Future<List<YearModelEntity>> getYearsByBrand(
      String vehicleType, String codeBrand) async {
    List<YearModelEntity> years = [];

    final response = await _dio.get(
        "https://parallelum.com.br/fipe/api/v2/$vehicleType/brands/$codeBrand/years");

    years = List.from(
      response.data.map(
        (year) => YearModelDto.fromMap(year),
      ),
    );

    return years;
  }
}
