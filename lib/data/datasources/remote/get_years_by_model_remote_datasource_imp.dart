import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/entities/year_model_entity.dart';
import '../../dtos/year_model_dto.dart';
import '../get_years_by_model_remote_datasource.dart';

class GetYearsByModelRemoteDatasourceImp
    implements GetYearsByModelRemoteDatasource {
  final Dio _dio;
  GetYearsByModelRemoteDatasourceImp(this._dio);

  @override
  Future<List<YearModelEntity>> getYearsByModel(
      String vehicleType, String brandCode, String modelCode) async {
    List<YearModelEntity> years = [];
   
    final response = await _dio.get(
        'https://parallelum.com.br/fipe/api/v2/$vehicleType/brands/$brandCode/models/$modelCode/years');

    years = List.from(
      response.data.map(
        (year) => YearModelDto.fromMap(year),
      ),
    );
    return years;
  }
      
}
