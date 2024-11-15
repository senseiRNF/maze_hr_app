import 'dart:convert';

class LocalCompanyJson {
  int? companyId;
  String? companyName;
  String? companyAddress;
  String? companyCallCenter;
  String? companyEmail;

  LocalCompanyJson({
    this.companyId,
    this.companyName,
    this.companyAddress,
    this.companyCallCenter,
    this.companyEmail,
  });

  String simplify() => jsonEncode({
    "company_id": companyId,
    "company_name": companyName,
    "company_address": companyAddress,
    "company_call_center": companyCallCenter,
    "company_email": companyEmail,
  });

  static LocalCompanyJson obscure({String? source}) {
    LocalCompanyJson result = LocalCompanyJson();

    if(source != null) {
      Map<String, dynamic> data = jsonDecode(source);

      result = LocalCompanyJson(
        companyId: data["company_id"],
        companyName: data["company_name"],
        companyAddress: data["company_address"],
        companyCallCenter: data["company_call_center"],
        companyEmail: data["company_email"],
      );
    }

    return result;
  }
}