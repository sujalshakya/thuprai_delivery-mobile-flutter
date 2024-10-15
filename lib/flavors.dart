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
        return 'Staging App';
      case Flavor.development:
        return 'Development App';
      default:
        return 'title';
    }
  }

}
