class ArticlesEntity {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  ArticlesEntity({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });
  DateTime? get publishDate => publishedAt == null ? null : DateTime.parse(publishedAt!);
}
