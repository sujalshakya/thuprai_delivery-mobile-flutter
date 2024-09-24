import 'package:thuprai_delivery/ui/views/couriered/models/couriered_model.dart';

abstract class CourieredRepository {
  Future<List<Couriered>> getCourieredOrders();
}
