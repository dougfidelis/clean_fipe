import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/model_entity.dart';
import '../../dtos/models_dto.dart';
import '../get_models_by_brand_remote_datasource.dart';

class GetModelsByBrandRemoteDatasourceImp
    implements GetModelsByBrandRemoteDatasource {
  final Dio _dio;
  GetModelsByBrandRemoteDatasourceImp(this._dio);

  @override
  Future<List<ModelEntity>> getModelsByBrand(
      String vehicleType, String brandCode) async {
    List<ModelEntity> models = [];
    
      try {
        final response = await _dio.get(
            'https://parallelum.com.br/fipe/api/v2/$vehicleType/brands/$brandCode/models');

        models = List.from(
          response.data.map((model) {
            return ModelsDto.fromMap(model);
          }),
        );
      } catch (error) {
        debugPrint(error.toString());
      }

      return models;
    
  }
}
