


class NewsResponse {
  String? id;
  String? newsHeader;
  String? newsHeaderBn;
  String? newsBody;
  String? newsBodyBn;
  String? file;
  String? date;

  NewsResponse({this.id, this.newsHeader, this.newsBody, this.file, this.date});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newsHeader = json['news_header'];
    newsBody = json['news_body'];
    file = json['file'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['news_header'] = this.newsHeader;
    data['news_body'] = this.newsBody;
    data['file'] = this.file;
    data['date'] = this.date;
    return data;
  }
}