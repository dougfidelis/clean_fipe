import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/year_model_entity.dart';
import '../../../domain/usecases/get_years_by_model_usecase.dart';

class YearsModelNotifier extends StateNotifier<List<YearModelEntity>> {
  GetYearsByModelUsecase _usecase;
  YearsModelNotifier(this._usecase) : super([]);

  Future<void> getYearsByModel(
      String vehicleType, String brandCode, String modelCode) async {
    state = [];
    state = await _usecase.getYearsByModel(vehicleType, brandCode, modelCode);
  }
}
