
import 'package:clean_fipe/data/datasources/get_models_by_brand_remote_datasource.dart';
import 'package:clean_fipe/domain/entities/model_entity.dart';

import '../../domain/repositories/get_models_by_brand_repository.dart';

class GetModelsByBrandRepositoryImp implements GetModelsByBrandRepository{
 final GetModelsByBrandRemoteDatasource _datasource;
  GetModelsByBrandRepositoryImp(this._datasource);


  @override
  Future<List<ModelEntity>> getModelsbyBrand(String vehicleType, String brandCode, String yearCode) async {
    return await _datasource.getModelsByBrand(vehicleType, brandCode, yearCode);
  }
  
}