
import 'package:clean_fipe/domain/entities/model_entity.dart';

abstract class GetModelsByBrandRepository {
  Future<List<ModelEntity>> getModelsbyBrand(String vehicleType, String brandCode, String yearCode);
}