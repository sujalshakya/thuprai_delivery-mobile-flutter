// ignore_for_file: constant_identifier_names

import 'dart:convert';

class Couriered {
  int id;
  String number;
  DateTime datePlaced;
  String totalInclTax;
  ShippingAddress shippingAddress;
  List<Line> lines;
  ShippingMethod shippingMethod;
  String shippingInclTax;
  List<PaymentEvent> paymentEvents;

  Couriered({
    required this.id,
    required this.number,
    required this.datePlaced,
    required this.totalInclTax,
    required this.shippingAddress,
    required this.lines,
    required this.shippingMethod,
    required this.shippingInclTax,
    required this.paymentEvents,
  });

  factory Couriered.fromRawJson(String str) =>
      Couriered.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Couriered.fromJson(Map<String, dynamic> json) => Couriered(
        id: json["id"],
        number: json["number"],
        datePlaced: DateTime.parse(json["date_placed"]),
        totalInclTax: json["total_incl_tax"],
        shippingAddress: ShippingAddress.fromJson(json["shipping_address"]),
        lines: List<Line>.from(json["lines"].map((x) => Line.fromJson(x))),
        shippingMethod: shippingMethodValues.map[json["shipping_method"]]!,
        shippingInclTax: json["shipping_incl_tax"],
        paymentEvents: List<PaymentEvent>.from(
            json["payment_events"].map((x) => PaymentEvent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "date_placed": datePlaced.toIso8601String(),
        "total_incl_tax": totalInclTax,
        "shipping_address": shippingAddress.toJson(),
        "lines": List<dynamic>.from(lines.map((x) => x.toJson())),
        "shipping_method": shippingMethodValues.reverse[shippingMethod],
        "shipping_incl_tax": shippingInclTax,
        "payment_events":
            List<dynamic>.from(paymentEvents.map((x) => x.toJson())),
      };
}

class Line {
  int id;
  String title;
  String upc;
  int quantity;
  String linePriceInclTax;
  String unitPriceInclTax;
  Status status;
  String partner;
  String? thumbnail;
  String? image;
  String productLink;

  Line({
    required this.id,
    required this.title,
    required this.upc,
    required this.quantity,
    required this.linePriceInclTax,
    required this.unitPriceInclTax,
    required this.status,
    required this.partner,
    required this.thumbnail,
    required this.image,
    required this.productLink,
  });

  factory Line.fromRawJson(String str) => Line.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Line.fromJson(Map<String, dynamic> json) => Line(
        id: json["id"],
        title: json["title"],
        upc: json["upc"],
        quantity: json["quantity"],
        linePriceInclTax: json["line_price_incl_tax"],
        unitPriceInclTax: json["unit_price_incl_tax"],
        status: statusValues.map[json["status"]]!,
        partner: json["partner"],
        thumbnail: json["thumbnail"],
        image: json["image"],
        productLink: json["product_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "upc": upc,
        "quantity": quantity,
        "line_price_incl_tax": linePriceInclTax,
        "unit_price_incl_tax": unitPriceInclTax,
        "status": statusValues.reverse[status],
        "partner": partner,
        "thumbnail": thumbnail,
        "image": image,
        "product_link": productLink,
      };
}

enum Status { CANCELLED, COURIERED }

final statusValues =
    EnumValues({"Cancelled": Status.CANCELLED, "Couriered": Status.COURIERED});

class PaymentEvent {
  String amount;
  String reference;
  int eventType;

  PaymentEvent({
    required this.amount,
    required this.reference,
    required this.eventType,
  });

  factory PaymentEvent.fromRawJson(String str) =>
      PaymentEvent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentEvent.fromJson(Map<String, dynamic> json) => PaymentEvent(
        amount: json["amount"],
        reference: json["reference"],
        eventType: json["event_type"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "reference": reference,
        "event_type": eventType,
      };
}

class ShippingAddress {
  int id;
  String firstName;
  String line1;
  Line2 line2;
  String line4;
  String phoneNumber;
  String notes;
  Country country;

  ShippingAddress({
    required this.id,
    required this.firstName,
    required this.line1,
    required this.line2,
    required this.line4,
    required this.phoneNumber,
    required this.notes,
    required this.country,
  });

  factory ShippingAddress.fromRawJson(String str) =>
      ShippingAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      ShippingAddress(
        id: json["id"],
        firstName: json["first_name"],
        line1: json["line1"],
        line2: line2Values.map[json["line2"]]!,
        line4: json["line4"],
        phoneNumber: json["phone_number"],
        notes: json["notes"],
        country: countryValues.map[json["country"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "line1": line1,
        "line2": line2Values.reverse[line2],
        "line4": line4,
        "phone_number": phoneNumber,
        "notes": notes,
        "country": countryValues.reverse[country],
      };
}

enum Country { AU, CH, DE, FR, GB, IN, JP, NP, US }

final countryValues = EnumValues({
  "AU": Country.AU,
  "CH": Country.CH,
  "DE": Country.DE,
  "FR": Country.FR,
  "GB": Country.GB,
  "IN": Country.IN,
  "JP": Country.JP,
  "NP": Country.NP,
  "US": Country.US
});

enum Line2 {
  DA7_4_HT,
  EMPTY,
  GU14_8_PT,
  MAS_CREMADELLS,
  ROYAL_STAY_108_ROOM_NO_402,
  THE_3_MAIN_STREET_HUNTINGTOWN_20639_MD,
  THE_8104_WENTWORTH_ROAD_BURWOOD_2134_NS
}

final line2Values = EnumValues({
  "Da7 4ht": Line2.DA7_4_HT,
  "": Line2.EMPTY,
  "GU14 8PT": Line2.GU14_8_PT,
  "Mas Cremadells": Line2.MAS_CREMADELLS,
  "Royal stay 10-8, Room no. 402": Line2.ROYAL_STAY_108_ROOM_NO_402,
  "3 Main street, Huntingtown, 20639 MD":
      Line2.THE_3_MAIN_STREET_HUNTINGTOWN_20639_MD,
  "8/104 Wentworth road burwood 2134 NS":
      Line2.THE_8104_WENTWORTH_ROAD_BURWOOD_2134_NS
});

enum ShippingMethod {
  BY_AIR_MAIL_FOR_AUSTRALIA_WITHIN_10_DAYS,
  BY_AIR_MAIL_FOR_FRANCE_WITHIN_10_DAYS,
  BY_AIR_MAIL_FOR_GERMANY_WITHIN_10_DAYS,
  BY_AIR_MAIL_FOR_GREAT_BRITAIN_WITHIN_10_DAYS,
  BY_AIR_MAIL_FOR_INDIA_WITHIN_10_DAYS,
  BY_AIR_MAIL_FOR_UNITED_STATES_WITHIN_10_DAYS,
  FREE_SHIPPING,
  FREE_SHIPPING_KTM_VALLEY,
  KTM_VALLEY_SHIPPING,
  OUTSIDE_VALLEY_SHIPPING,
  STANDARD_SHIPPING_ZONE_1_MIN_10_DAYS,
  STANDARD_SHIPPING_ZONE_3_MIN_10_DAYS,
  STANDARD_SHIPPING_ZONE_4_MIN_10_DAYS
}

final shippingMethodValues = EnumValues({
  "By Air Mail for Australia (within 10 days)":
      ShippingMethod.BY_AIR_MAIL_FOR_AUSTRALIA_WITHIN_10_DAYS,
  "By Air Mail for France (within 10 days)":
      ShippingMethod.BY_AIR_MAIL_FOR_FRANCE_WITHIN_10_DAYS,
  "By Air Mail for Germany (within 10 days)":
      ShippingMethod.BY_AIR_MAIL_FOR_GERMANY_WITHIN_10_DAYS,
  "By Air Mail for Great Britain (within 10 days)":
      ShippingMethod.BY_AIR_MAIL_FOR_GREAT_BRITAIN_WITHIN_10_DAYS,
  "By Air Mail for India (within 10 days)":
      ShippingMethod.BY_AIR_MAIL_FOR_INDIA_WITHIN_10_DAYS,
  "By Air Mail for United States (within 10 days)":
      ShippingMethod.BY_AIR_MAIL_FOR_UNITED_STATES_WITHIN_10_DAYS,
  "Free Shipping": ShippingMethod.FREE_SHIPPING,
  "Free Shipping - KTM Valley": ShippingMethod.FREE_SHIPPING_KTM_VALLEY,
  "KTM Valley Shipping": ShippingMethod.KTM_VALLEY_SHIPPING,
  "Outside Valley Shipping": ShippingMethod.OUTSIDE_VALLEY_SHIPPING,
  "Standard Shipping Zone 1 (Min 10 days)":
      ShippingMethod.STANDARD_SHIPPING_ZONE_1_MIN_10_DAYS,
  "Standard Shipping Zone 3 (Min 10 days)":
      ShippingMethod.STANDARD_SHIPPING_ZONE_3_MIN_10_DAYS,
  "Standard Shipping Zone 4 (Min 10 days)":
      ShippingMethod.STANDARD_SHIPPING_ZONE_4_MIN_10_DAYS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
