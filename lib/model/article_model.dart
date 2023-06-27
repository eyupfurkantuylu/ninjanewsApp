class Post {
  final int id;
  final DateTime date;
  final String slug;
  final String status;
  final String type;
  final String link;
  final Title title;
  final Content content;
  final int featuredMedia;
  final String jetpackFeaturedMediaUrl;

  Post({
    required this.id,
    required this.date,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.featuredMedia,
    required this.jetpackFeaturedMediaUrl,
  });

  Post copyWith({
    int? id,
    DateTime? date,
    String? slug,
    String? status,
    String? type,
    String? link,
    Title? title,
    Content? content,
    int? featuredMedia,
    String? jetpackFeaturedMediaUrl,
  }) =>
      Post(
        id: id ?? this.id,
        date: date ?? this.date,
        slug: slug ?? this.slug,
        status: status ?? this.status,
        type: type ?? this.type,
        link: link ?? this.link,
        title: title ?? this.title,
        content: content ?? this.content,
        featuredMedia: featuredMedia ?? this.featuredMedia,
        jetpackFeaturedMediaUrl:
            jetpackFeaturedMediaUrl ?? this.jetpackFeaturedMediaUrl,
      );
}

class Content {
  final String rendered;
  final bool protected;

  Content({
    required this.rendered,
    required this.protected,
  });

  Content copyWith({
    String? rendered,
    bool? protected,
  }) =>
      Content(
        rendered: rendered ?? this.rendered,
        protected: protected ?? this.protected,
      );
}

class Title {
  final String rendered;

  Title({
    required this.rendered,
  });

  Title copyWith({
    String? rendered,
  }) =>
      Title(
        rendered: rendered ?? this.rendered,
      );
}
