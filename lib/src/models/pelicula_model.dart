class Peliculas {
  List<Pelicula> items = [];
  Peliculas();
  Peliculas.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  String uniqueId = '';
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  late String originalTitle;
  late String overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  late String title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Pelicula({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];

    voteAverage = json['vote_average'] / 1;
    voteCount = json['vote_count'];
  }

  getPosterImg() {
    if (posterPath == null) {
      return 'https://hectorcardelino.com.uy/wp-content/uploads/2020/09/noimage-1.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }

  getBackdropImg() {
    if (posterPath == null) {
      return 'https://hectorcardelino.com.uy/wp-content/uploads/2020/09/noimage-1.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }
}
