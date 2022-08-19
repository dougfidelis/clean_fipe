import '../../domain/entities/model_entity.dart';

abstract class GetModelsByBrandRemoteDatasource {
  Future<List<ModelEntity>> getModelsByBrand(
      String vehicleType, String brandCode);
}
