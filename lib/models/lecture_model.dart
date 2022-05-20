import 'lecturer_model.dart';

/// title : ""
/// description : ""
/// image_url : ""
/// audio_url : ""
/// series_id : ""
/// tags : ""
/// created_at : ""
/// lecture_id : ""

class LectureModel {
  LectureModel({
      this.title, 
      this.lecturer,
      this.description,
      this.imageUrl, 
      this.audioUrl, 
      this.seriesId, 
      this.tags, 
      this.createdAt, 
      this.lectureId,});

  LectureModel.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    imageUrl = json['image_url'];
    audioUrl = json['audio_url'];
    seriesId = json['series_id'];
    tags = json['tags'];
    createdAt = json['created_at'];
    lectureId = json['lecture_id'];
    lecturer = LecturerModel.fromJson(json['lecturer']);
  }
  String? title;
  String? description;
  String? imageUrl;
  String? audioUrl;
  String? seriesId;
  String? tags;
  String? createdAt;
  String? lectureId;
  LecturerModel? lecturer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['image_url'] = imageUrl;
    map['audio_url'] = audioUrl;
    map['series_id'] = seriesId;
    map['tags'] = tags;
    map['created_at'] = createdAt;
    map['lecture_id'] = lectureId;
    map['lecturer'] = lecturer!.toJson();
    return map;
  }

}