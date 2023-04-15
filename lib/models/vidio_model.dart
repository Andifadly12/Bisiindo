class VidioModel {
  int id;
  String url;

  VidioModel({this.id, this.url});

  VidioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url};
  }
}
