import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entities/brand_entity.dart';
import '../../dtos/brands_dto.dart';
import '../get_brands_by_vehicle_type_remote_datasource.dart';

class GetBrandsByVehicleTypeRemoteDatasourceImp
    implements GetBrandsByVehicleTypeRemoteDatasource {
  final Dio _dio;
  GetBrandsByVehicleTypeRemoteDatasourceImp(this._dio);

  @override
  Future<List<BrandEntity>> getBrandsByVehicleType(String vehicleType) async {
    List<BrandEntity> brands = [];
   
    try {
      final response = await _dio
          .get('https://parallelum.com.br/fipe/api/v2/$vehicleType/brands');

      brands = List.from(
        response.data.map((brand) {
          return BrandsDto.fromMap(brand);
        }),
      );
    } catch (error) {
      debugPrint(error.toString());
    }

    return brands;
  }
}
