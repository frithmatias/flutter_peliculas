class Actores {
  List<Actor> items = [];

  Actores.fromJsonList(List<dynamic> jsonList) {
    jsonList.forEach((element) {
      final actor = Actor.fromJsonMap(element);
      items.add(actor);
    });
  }
}

class Actor {
  late bool? adult;
  late int? gender;
  late int? id;
  late String? knownForDepartment;
  late String name;
  late String? originalName;
  late double? popularity;
  late String? profilePath;
  late int? castId;
  late String? character;
  late String? creditId;
  late int? order;
  late String? department;
  late String? job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name = '',
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    department = json['department'];
    job = json['job'];
  }

  getProfilePath() {
    if (profilePath == null) {
      return 'https://hectorcardelino.com.uy/wp-content/uploads/2020/09/no-avatar.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
