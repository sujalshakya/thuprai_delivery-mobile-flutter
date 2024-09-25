import 'package:thuprai_delivery/ui/views/returned/models/returned_model.dart';

abstract class ReturnedRepository {
  Future<List<Returned>> getReturnedOrders();
}
