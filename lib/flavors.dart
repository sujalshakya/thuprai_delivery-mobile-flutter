enum Flavor {
  staging,
  development,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.staging:
        return 'Thuprai Delivery -Staging';
      case Flavor.development:
        return 'Thuprai Delivery -Development';
      default:
        return 'title';
    }
  }

}
