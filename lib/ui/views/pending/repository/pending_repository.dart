import 'package:thuprai_delivery/ui/views/pending/models/pending_model.dart';

abstract class PendingRepository {
  Future<List<Pending>> getPendingOrders();
}
