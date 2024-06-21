class StuProfModel {
  StuProfModel({
    this.id,
    this.fileName,
    this.fileData,
    this.subId,
  });

  StuProfModel.fromJson(dynamic json) {
    id = json['id'];
    fileName = json['fileName'];
    fileData = json['fileData'];
    subId = json['subId'];
  }

  int? id;
  String? fileName;
  String? fileData; // سيتم تخزين البيانات بتنسيق base64
  int? subId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fileName'] = fileName;
    map['fileData'] = fileData;
    map['subId'] = subId;
    return map;
  }
}
