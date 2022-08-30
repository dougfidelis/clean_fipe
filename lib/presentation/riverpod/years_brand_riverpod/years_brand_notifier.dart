import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/year_model_entity.dart';
import '../../../domain/usecases/get_years_by_brand_usecase.dart';

class YearsBrandNotifier extends StateNotifier<List<YearModelEntity>> {
  final GetYearsByBrandUsecase _usecase;
  YearsBrandNotifier(this._usecase) : super([]);

  Future<void> getYearsByBrand(
      String vehicleType, String brandCode) async {
    state = [];
    state = await _usecase.getYearsByModel(
      vehicleType,
      brandCode,
    );
  }
}
