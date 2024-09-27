import 'package:thuprai_delivery/ui/views/picking_up/models/picking_up_model.dart';

abstract class PickingUpRepository {
  Future<List<PickingUp>> getPickingUpOrders();
}
