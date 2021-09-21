class MatchResponse {
  late int count;
  late Filters filters;
  late Competition competition;
  late List<Matches> matches;

  MatchResponse({required this.count, required this.filters, required this.competition, required this.matches});

  MatchResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    filters =
    (json['filters'] != null ? new Filters.fromJson(json['filters']) : null)!;
    competition = (json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null)!;
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches.add(new Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.filters != null) {
      data['filters'] = this.filters.toJson();
    }
    if (this.competition != null) {
      data['competition'] = this.competition.toJson();
    }
    if (this.matches != null) {
      data['matches'] = this.matches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Filters {
  late List<String> status;

  Filters({required this.status});

  Filters.fromJson(Map<String, dynamic> json) {
    status = json['status'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
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
      {required this.id, required this.area, required this.name, required this.code, required this.plan, required this.lastUpdated});

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

class Matches {
  late int id;
  late Season season;
  late String utcDate;
  late String status;
  late int matchday;
  late String stage;
  String? group;
  late String lastUpdated;
  late Score score;
  late Area homeTeam;
  late Area awayTeam;


  Matches(
      {required this.id,
        required this.season,
        required this.utcDate,
        required this.status,
        required this.matchday,
        required this.stage,
        required this.group,
        required this.lastUpdated,
        required this.score,
        required this.homeTeam,
        required this.awayTeam,});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    season =
    (json['season'] != null ? new Season.fromJson(json['season']) : null)!;
    utcDate = json['utcDate'];
    status = json['status'];
    matchday = json['matchday'];
    stage = json['stage'];
    group = json['group'];
    lastUpdated = json['lastUpdated'];
    score = (json['score'] != null ? new Score.fromJson(json['score']) : null)!;
    homeTeam =
    (json['homeTeam'] != null ? new Area.fromJson(json['homeTeam']) : null)!;
    awayTeam =
    (json['awayTeam'] != null ? new Area.fromJson(json['awayTeam']) : null)!;
     }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.season != null) {
      data['season'] = this.season.toJson();
    }
    data['utcDate'] = this.utcDate;
    data['status'] = this.status;
    data['matchday'] = this.matchday;
    data['stage'] = this.stage;
    data['group'] = this.group;
    data['lastUpdated'] = this.lastUpdated;
    if (this.score != null) {
      data['score'] = this.score.toJson();
    }
    if (this.homeTeam != null) {
      data['homeTeam'] = this.homeTeam.toJson();
    }
    if (this.awayTeam != null) {
      data['awayTeam'] = this.awayTeam.toJson();
    }
    return data;
  }
}

class Season {
  late  int id;
  late String startDate;
  late  String endDate;
  late  int currentMatchday;

  Season({required this.id, required this.startDate, required this.endDate, required this.currentMatchday});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    currentMatchday = json['currentMatchday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['currentMatchday'] = this.currentMatchday;
    return data;
  }
}



class Score {
  late String winner;
  late String duration;
  late FullTime fullTime;
  late FullTime halfTime;
  late FullTime extraTime;


  Score(
      {required this.winner,
        required this.duration,
        required this.fullTime,
        required this.halfTime,
        required this.extraTime,});
  // required this.penalties});

  Score.fromJson(Map<String, dynamic> json) {
    winner = json['winner'];
    duration = json['duration'];
    fullTime = (json['fullTime'] != null
        ? new FullTime.fromJson(json['fullTime'])
        : null)!;
    halfTime = (json['halfTime'] != null
        ? new FullTime.fromJson(json['halfTime'])
        : null)!;
    extraTime = (json['extraTime'] != null
        ? new FullTime.fromJson(json['extraTime'])
        : null)!;
    // penalties = (json['penalties'] != null
    //     ? new Penalties.fromJson(json['penalties'])
    //     : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['winner'] = this.winner;
    data['duration'] = this.duration;
    if (this.fullTime != null) {
      data['fullTime'] = this.fullTime.toJson();
    }
    if (this.halfTime != null) {
      data['halfTime'] = this.halfTime.toJson();
    }
    if (this.extraTime != null) {
      data['extraTime'] = this.extraTime.toJson();
    }
    // if (this.penalties != null) {
    //   data['penalties'] = this.penalties.toJson();
    // }
    return data;
  }
}

class FullTime {
  late int homeTeam;
  late int awayTeam;

  FullTime({required this.homeTeam, required this.awayTeam});

  FullTime.fromJson(Map<String, dynamic> json) {
    homeTeam = json['homeTeam'];
    awayTeam = json['awayTeam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['homeTeam'] = this.homeTeam;
    data['awayTeam'] = this.awayTeam;
    return data;
  }
}


