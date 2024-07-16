import 'package:practice_list_view/domain/models/equipment_model.dart';

abstract class ApiUseCase {
  Future<List<EquipmentModel>> getAllEquipment();
}
