// ignore_for_file: constant_identifier_names

import 'dart:convert';

class Processing {
  int? id;
  String? number;
  DateTime? datePlaced;
  String? totalInclTax;
  ShippingAddress? shippingAddress;
  List<Line>? lines;
  ShippingMethod? shippingMethod;
  String? shippingInclTax;
  List<PaymentEvent>? paymentEvents;

  Processing({
    this.id,
    this.number,
    this.datePlaced,
    this.totalInclTax,
    this.shippingAddress,
    this.lines,
    this.shippingMethod,
    this.shippingInclTax,
    this.paymentEvents,
  });

  factory Processing.fromRawJson(String str) =>
      Processing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Processing.fromJson(Map<String, dynamic> json) => Processing(
        id: json["id"],
        number: json["number"],
        datePlaced: json["date_placed"] == null
            ? null
            : DateTime.parse(json["date_placed"]),
        totalInclTax: json["total_incl_tax"],
        shippingAddress: json["shipping_address"] == null
            ? null
            : ShippingAddress.fromJson(json["shipping_address"]),
        lines: json["lines"] == null
            ? []
            : List<Line>.from(json["lines"]!.map((x) => Line.fromJson(x))),
        shippingMethod: shippingMethodValues.map[json["shipping_method"]]!,
        shippingInclTax: json["shipping_incl_tax"],
        paymentEvents: json["payment_events"] == null
            ? []
            : List<PaymentEvent>.from(
                json["payment_events"]!.map((x) => PaymentEvent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "date_placed": datePlaced?.toIso8601String(),
        "total_incl_tax": totalInclTax,
        "shipping_address": shippingAddress?.toJson(),
        "lines": lines == null
            ? []
            : List<dynamic>.from(lines!.map((x) => x.toJson())),
        "shipping_method": shippingMethodValues.reverse[shippingMethod],
        "shipping_incl_tax": shippingInclTax,
        "payment_events": paymentEvents == null
            ? []
            : List<dynamic>.from(paymentEvents!.map((x) => x.toJson())),
      };
}

class Line {
  int? id;
  String? title;
  String? upc;
  int? quantity;
  String? linePriceInclTax;
  String? unitPriceInclTax;
  Status? status;
  Partner? partner;
  String? thumbnail;
  String? image;
  String? productLink;

  Line({
    this.id,
    this.title,
    this.upc,
    this.quantity,
    this.linePriceInclTax,
    this.unitPriceInclTax,
    this.status,
    this.partner,
    this.thumbnail,
    this.image,
    this.productLink,
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
        partner: partnerValues.map[json["partner"]]!,
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
        "partner": partnerValues.reverse[partner],
        "thumbnail": thumbnail,
        "image": image,
        "product_link": productLink,
      };
}

enum Partner { THUPRAI }

final partnerValues = EnumValues({"Thuprai": Partner.THUPRAI});

enum Status { PROCESSING }

final statusValues = EnumValues({"Processing": Status.PROCESSING});

class PaymentEvent {
  String? amount;
  String? reference;
  int? eventType;

  PaymentEvent({
    this.amount,
    this.reference,
    this.eventType,
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
  int? id;
  String? firstName;
  String? line1;
  String? line2;
  String? line4;
  String? phoneNumber;
  String? notes;
  Country? country;

  ShippingAddress({
    this.id,
    this.firstName,
    this.line1,
    this.line2,
    this.line4,
    this.phoneNumber,
    this.notes,
    this.country,
  });

  factory ShippingAddress.fromRawJson(String str) =>
      ShippingAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      ShippingAddress(
        id: json["id"],
        firstName: json["first_name"],
        line1: json["line1"],
        line2: json["line2"],
        line4: json["line4"],
        phoneNumber: json["phone_number"],
        notes: json["notes"],
        country: countryValues.map[json["country"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "line1": line1,
        "line2": line2,
        "line4": line4,
        "phone_number": phoneNumber,
        "notes": notes,
        "country": countryValues.reverse[country],
      };
}

enum Country { NP }

final countryValues = EnumValues({"NP": Country.NP});

enum ShippingMethod { KTM_VALLEY_SHIPPING, OUTSIDE_VALLEY_SHIPPING }

final shippingMethodValues = EnumValues({
  "KTM Valley Shipping": ShippingMethod.KTM_VALLEY_SHIPPING,
  "Outside Valley Shipping": ShippingMethod.OUTSIDE_VALLEY_SHIPPING
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
