class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : // named constructor
        title = json['title'],
        thumb = json['thumb'],
        id = json['id'];

  WebtoonModel({
    required this.title,
    required this.thumb,
    required this.id,
  });
}
