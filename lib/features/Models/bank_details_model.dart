import 'dart:convert';

BankDetailsModel bankDetailsModelFromMap(String str) =>
    BankDetailsModel.fromMap(json.decode(str));

String bankDetailsModelToMap(BankDetailsModel data) =>
    json.encode(data.toMap());

class BankDetailsModel {
  final bool success;
  final Commodities commodities;
  final String message;

  BankDetailsModel({
    required this.success,
    required this.commodities,
    required this.message,
  });

  BankDetailsModel copyWith({
    bool? success,
    Commodities? commodities,
    String? message,
  }) =>
      BankDetailsModel(
        success: success ?? this.success,
        commodities: commodities ?? this.commodities,
        message: message ?? this.message,
      );

  factory BankDetailsModel.fromMap(Map<String, dynamic> json) =>
      BankDetailsModel(
        success: json["success"],
        commodities: Commodities.fromMap(json["commodities"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "commodities": commodities.toMap(),
        "message": message,
      };
}

class Commodities {
  final String id;
  final List<BankDetail> bankDetails;

  Commodities({
    required this.id,
    required this.bankDetails,
  });

  Commodities copyWith({
    String? id,
    List<BankDetail>? bankDetails,
  }) =>
      Commodities(
        id: id ?? this.id,
        bankDetails: bankDetails ?? this.bankDetails,
      );

  factory Commodities.fromMap(Map<String, dynamic> json) => Commodities(
        id: json["_id"],
        bankDetails: List<BankDetail>.from(
            json["bankDetails"].map((x) => BankDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "bankDetails": List<dynamic>.from(bankDetails.map((x) => x.toMap())),
      };
}

class BankDetail {
  final String holderName;
  final String bankName;
  final String accountNumber;
  final String iban;
  final String ifsc;
  final String swift;
  final String branch;
  final String city;
  final String country;
  final String logo;
  final String id;

  BankDetail({
    required this.holderName,
    required this.bankName,
    required this.accountNumber,
    required this.iban,
    required this.ifsc,
    required this.swift,
    required this.branch,
    required this.city,
    required this.country,
    required this.logo,
    required this.id,
  });

  BankDetail copyWith({
    String? holderName,
    String? bankName,
    String? accountNumber,
    String? iban,
    String? ifsc,
    String? swift,
    String? branch,
    String? city,
    String? country,
    String? logo,
    String? id,
  }) =>
      BankDetail(
        holderName: holderName ?? this.holderName,
        bankName: bankName ?? this.bankName,
        accountNumber: accountNumber ?? this.accountNumber,
        iban: iban ?? this.iban,
        ifsc: ifsc ?? this.ifsc,
        swift: swift ?? this.swift,
        branch: branch ?? this.branch,
        city: city ?? this.city,
        country: country ?? this.country,
        logo: logo ?? this.logo,
        id: id ?? this.id,
      );

  factory BankDetail.fromMap(Map<String, dynamic> json) => BankDetail(
        holderName: json["holderName"],
        bankName: json["bankName"],
        accountNumber: json["accountNumber"],
        iban: json["iban"],
        ifsc: json["ifsc"],
        swift: json["swift"],
        branch: json["branch"],
        city: json["city"],
        country: json["country"],
        logo: json["logo"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "holderName": holderName,
        "bankName": bankName,
        "accountNumber": accountNumber,
        "iban": iban,
        "ifsc": ifsc,
        "swift": swift,
        "branch": branch,
        "city": city,
        "country": country,
        "logo": logo,
        "_id": id,
      };
}
