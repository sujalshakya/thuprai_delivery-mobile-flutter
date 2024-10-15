enum Flavor {
  staging,
  development,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get fulfilled {
    switch (appFlavor) {
      case Flavor.staging:
        return 'No fulfilled page- staging';
      case Flavor.development:
        return 'No fulfilled page - development';
      default:
        return 'No fulfilled page';
    }
  }
}
