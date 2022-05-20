/// full_name : ""
/// image_url : ""
/// lecturerId : ""

class LecturerModel {
  LecturerModel({
      String? fullName, 
      String? imageUrl, 
      String? lecturerId,}){
    _fullName = fullName;
    _imageUrl = imageUrl;
    _lecturerId = lecturerId;
}

  LecturerModel.fromJson(dynamic json) {
    _fullName = json['full_name'];
    _imageUrl = json['image_url'];
    _lecturerId = json['lecturerId'];
  }
  String? _fullName;
  String? _imageUrl;
  String? _lecturerId;
LecturerModel copyWith({  String? fullName,
  String? imageUrl,
  String? lecturerId,
}) => LecturerModel(  fullName: fullName ?? _fullName,
  imageUrl: imageUrl ?? _imageUrl,
  lecturerId: lecturerId ?? _lecturerId,
);
  String? get fullName => _fullName;
  String? get imageUrl => _imageUrl;
  String? get lecturerId => _lecturerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = _fullName;
    map['image_url'] = _imageUrl;
    map['lecturerId'] = _lecturerId;
    return map;
  }

}