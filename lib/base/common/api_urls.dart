class ApiUrls {
  static String orderEndPoint = "delivery/order";
  static final String dispatchEndPoint = "$orderEndPoint/dispatched/";
  static String pendingEndPoint = "$orderEndPoint/pending/";
  static String fullfilledEndPoint = "$orderEndPoint/fulfilled/";
  static String returnedEndPoint = "$orderEndPoint/returned/";
  static String processingEndPoint = "$orderEndPoint/processing/";
  static String pickingUpEndPoint = "$orderEndPoint/picking-up/";
  static String courieredEndPoint = "$orderEndPoint/couriered/";

  static String changeDeliveryStatusEndPoint = "delivery/";
  static String markAsPickedUpEndPoint = "delivery/order/mark-pickedup/";
}
