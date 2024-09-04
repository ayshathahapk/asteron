class BankDetailsModel {
  final String AccountNumber;
  final String IBANCode;
  final String IFSCcode;
  final String SWIFTcode;
  final String bankName;
  final String branch;
  final String city;
  final String country;
  final String holderName;

//<editor-fold desc="Data Methods">
  const BankDetailsModel({
    required this.AccountNumber,
    required this.IBANCode,
    required this.IFSCcode,
    required this.SWIFTcode,
    required this.bankName,
    required this.branch,
    required this.city,
    required this.country,
    required this.holderName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankDetailsModel &&
          runtimeType == other.runtimeType &&
          AccountNumber == other.AccountNumber &&
          IBANCode == other.IBANCode &&
          IFSCcode == other.IFSCcode &&
          SWIFTcode == other.SWIFTcode &&
          bankName == other.bankName &&
          branch == other.branch &&
          city == other.city &&
          country == other.country &&
          holderName == other.holderName);

  @override
  int get hashCode =>
      AccountNumber.hashCode ^
      IBANCode.hashCode ^
      IFSCcode.hashCode ^
      SWIFTcode.hashCode ^
      bankName.hashCode ^
      branch.hashCode ^
      city.hashCode ^
      country.hashCode ^
      holderName.hashCode;

  @override
  String toString() {
    return 'BankDetailsModel{ AccountNumber: $AccountNumber, IBANCode: $IBANCode, IFSCcode: $IFSCcode, SWIFTcode: $SWIFTcode, bankName: $bankName, branch: $branch, city: $city, country: $country, holderName: $holderName,}';
  }

  BankDetailsModel copyWith({
    String? AccountNumber,
    String? IBANCode,
    String? IFSCcode,
    String? SWIFTcode,
    String? bankName,
    String? branch,
    String? city,
    String? country,
    String? holderName,
  }) {
    return BankDetailsModel(
      AccountNumber: AccountNumber ?? this.AccountNumber,
      IBANCode: IBANCode ?? this.IBANCode,
      IFSCcode: IFSCcode ?? this.IFSCcode,
      SWIFTcode: SWIFTcode ?? this.SWIFTcode,
      bankName: bankName ?? this.bankName,
      branch: branch ?? this.branch,
      city: city ?? this.city,
      country: country ?? this.country,
      holderName: holderName ?? this.holderName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'AccountNumber': AccountNumber,
      'IBANCode': IBANCode,
      'IFSCcode': IFSCcode,
      'SWIFTcode': SWIFTcode,
      'bankName': bankName,
      'branch': branch,
      'city': city,
      'country': country,
      'holderName': holderName,
    };
  }

  factory BankDetailsModel.fromMap(Map<String, dynamic> map) {
    return BankDetailsModel(
      AccountNumber: map['AccountNumber'] ?? "",
      IBANCode: map['IBANCode'] ?? "",
      IFSCcode: map['IFSCcode'] ?? "",
      SWIFTcode: map['SWIFTcode'] ?? "",
      bankName: map['bankName'] ?? "",
      branch: map['branch'] ?? "",
      city: map['city'] ?? "",
      country: map['country'] ?? "",
      holderName: map['holderName'] ?? "",
    );
  }

//</editor-fold>
}
