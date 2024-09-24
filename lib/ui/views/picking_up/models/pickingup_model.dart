import 'dart:convert';

class PickingUp {
  int id;
  String number;
  DateTime datePlaced;
  String totalInclTax;
  ShippingAddress shippingAddress;
  List<Line> lines;
  String shippingMethod;
  String shippingInclTax;
  List<dynamic> paymentEvents;

  PickingUp({
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

  factory PickingUp.fromRawJson(String str) =>
      PickingUp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickingUp.fromJson(Map<String, dynamic> json) => PickingUp(
        id: json["id"],
        number: json["number"],
        datePlaced: DateTime.parse(json["date_placed"]),
        totalInclTax: json["total_incl_tax"],
        shippingAddress: ShippingAddress.fromJson(json["shipping_address"]),
        lines: List<Line>.from(json["lines"].map((x) => Line.fromJson(x))),
        shippingMethod: json["shipping_method"],
        shippingInclTax: json["shipping_incl_tax"],
        paymentEvents: List<dynamic>.from(json["payment_events"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "date_placed": datePlaced.toIso8601String(),
        "total_incl_tax": totalInclTax,
        "shipping_address": shippingAddress.toJson(),
        "lines": List<dynamic>.from(lines.map((x) => x.toJson())),
        "shipping_method": shippingMethod,
        "shipping_incl_tax": shippingInclTax,
        "payment_events": List<dynamic>.from(paymentEvents.map((x) => x)),
      };
}

class Line {
  int id;
  String title;
  String upc;
  int quantity;
  String linePriceInclTax;
  String unitPriceInclTax;
  String status;
  String partner;
  String thumbnail;
  String image;
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
        status: json["status"],
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
        "status": status,
        "partner": partner,
        "thumbnail": thumbnail,
        "image": image,
        "product_link": productLink,
      };
}

class ShippingAddress {
  int id;
  String firstName;
  String line1;
  String line2;
  String line4;
  String phoneNumber;
  String notes;
  String country;

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
        line2: json["line2"],
        line4: json["line4"],
        phoneNumber: json["phone_number"],
        notes: json["notes"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "line1": line1,
        "line2": line2,
        "line4": line4,
        "phone_number": phoneNumber,
        "notes": notes,
        "country": country,
      };
}
