class TeamResponse {
  late int count;
  late Competition competition;
  late Season season;
  late List<Teams> teams;

  TeamResponse(
      {required this.count,
        required this.competition,
        required this.season,
        required this.teams});

  TeamResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    competition = (json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null)!;
    season =
    (json['season'] != null ? new Season.fromJson(json['season']) : null)!;
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams.add(new Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.competition != null) {
      data['competition'] = this.competition.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season.toJson();
    }
    if (this.teams != null) {
      data['teams'] = this.teams.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Competition {
  late int id;
  late Area area;
  late String name;
  late String code;
  late String plan;
  late String lastUpdated;

  Competition(
      {required this.id,
        required this.area,
        required this.name,
        required this.code,
        required this.plan,
        required this.lastUpdated});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    area = (json['area'] != null ? new Area.fromJson(json['area']) : null)!;
    name = json['name'];
    code = json['code'];
    plan = json['plan'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.area != null) {
      data['area'] = this.area.toJson();
    }
    data['name'] = this.name;
    data['code'] = this.code;
    data['plan'] = this.plan;
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}

class Area {
  late int id;
  late String name;

  Area({required this.id, required this.name});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Season {
  late int id;
  late String startDate;
  late String endDate;
  late int currentMatchday;
  late Winner? winner;

  Season(
      {required this.id,
        required this.startDate,
        required this.endDate,
        required this.currentMatchday,
        required this.winner});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    currentMatchday = json['currentMatchday'];
    winner =
    (json['winner'] != null ? new Winner.fromJson(json['winner']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['currentMatchday'] = this.currentMatchday;
    if (this.winner != null) {
      data['winner'] = this.winner!.toJson();
    }
    return data;
  }
}

class Winner {
  late int id;
  late String name;
  late String shortName;
  late String tla;
  late String crestUrl;

  Winner(
      {required this.id,
        required this.name,
        required this.shortName,
        required this.tla,
        required this.crestUrl});

  Winner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = (json['name'] != null ? (json['name']) : "empty");
    shortName = json['shortName'];
    tla = json['tla'];
    crestUrl = json['crestUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['tla'] = this.tla;
    data['crestUrl'] = this.crestUrl;
    return data;
  }
}

class Teams {
  late int id;
  late Area area;
  late String name;
  late String shortName;
  late String tla;
  late String crestUrl;
  late String address;
  late String phone;
  late String website;
  late String email;
  late int founded;
  late String clubColors;
  late String venue;
  late String lastUpdated;

  Teams(
      {required this.id,
        required this.area,
        required this.name,
        required this.shortName,
        required this.tla,
        required this.crestUrl,
        required this.address,
        required this.phone,
        required this.website,
        required this.email,
        required this.founded,
        required this.clubColors,
        required this.venue,
        required this.lastUpdated});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    area = (json['area'] != null ? new Area.fromJson(json['area']) : null)!;
    name = json['name'];
    shortName = json['shortName'];
    tla = json['tla'];
    crestUrl = json['crestUrl'] != null ? json['crestUrl'] : " no image";
    address = json['address'];
    phone = json['phone'];
    website = json['website'];
    email = json['email'];
    founded = json['founded'];
    clubColors = json['clubColors'];
    venue = json['venue'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.area != null) {
      data['area'] = this.area.toJson();
    }
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['tla'] = this.tla;
    data['crestUrl'] = this.crestUrl;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['email'] = this.email;
    data['founded'] = this.founded;
    data['clubColors'] = this.clubColors;
    data['venue'] = this.venue;
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}
