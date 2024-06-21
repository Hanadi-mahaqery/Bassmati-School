class InstallModel {
  InstallModel({
    this.installNo,
    this.installStatus,
    this.installDate,
    this.amountDue,
    this.amountPaid,
  });

  InstallModel.fromJson(dynamic json) {
    installNo = json['installNo'];
    installStatus = json['installStatus'] as bool;
    installDate = json['installDate'];
    amountDue = json['amountDue'];
    amountPaid = json['amountPaid'];
  }

  int? installNo;
  bool? installStatus; // تأكد من أن النوع هو bool
  String? installDate;
  int? amountDue;
  int? amountPaid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['installNo'] = installNo;
    map['installStatus'] = installStatus;
    map['installDate'] = installDate;
    map['amountDue'] = amountDue;
    map['amountPaid'] = amountPaid;
    return map;
  }
}
