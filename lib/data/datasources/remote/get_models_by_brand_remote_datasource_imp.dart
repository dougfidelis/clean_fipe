
import 'package:clean_fipe/data/datasources/get_models_by_brand_remote_datasource.dart';
import 'package:clean_fipe/data/dtos/models_dto.dart';
import 'package:clean_fipe/domain/entities/model_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetModelsByBrandRemoteDatasourceImp implements GetModelsByBrandRemoteDatasource{
   
   final Dio _dio;
   GetModelsByBrandRemoteDatasourceImp(this._dio);

  @override
  Future<List<ModelEntity>> getModelsByBrand(String vehicleType, String brandCode) async {
    List<ModelEntity> brands = [];
    if (brandCode == '') {
      return [];
    } else {
      
    try {
      final response = await _dio
          .get('https://parallelum.com.br/fipe/api/v2/$vehicleType/brands/$brandCode/models');

      brands = List.from(
        response.data.map((brand) {
          return ModelsDto.fromMap(brand);
        }),
      );
    } catch (error) {
      debugPrint(error.toString());
    }

    return brands;
    }
  }
  
  
}