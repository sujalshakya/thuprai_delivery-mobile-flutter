import 'package:thuprai_delivery/ui/views/processing/models/processing_model.dart';

abstract class ProcessingRepository {
  Future<List<Processing>> getDispatchedOrders();
}
