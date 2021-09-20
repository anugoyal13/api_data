class MatchResponse {
  late int count;
 // late Filters filters;
  late Competition competition;
  late List<Matches> matches;

  MatchResponse({required this.count,  required this.competition, required this.matches});

  MatchResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  //  filters = (json['filters'] != null ? new Filters.fromJson(json['filters']) : null)!;
    competition = (json['competition'] != null ? new Competition.fromJson(json['competition']) : null)!;
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) { matches.add(new Matches.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    // if (this.filters != null) {
    //   data['filters'] = this.filters.toJson();
    // }
    if (this.competition != null) {
      data['competition'] = this.competition.toJson();
    }
    if (this.matches != null) {
      data['matches'] = this.matches.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Filters {
//
//
//   Filters({});

//Filters.fromJson(Map<String, dynamic> json) {
//}

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   return data;
// }
// }

class Competition {
  late int id;
  late String name;
  late String code;
  late String lastUpdated;

  Competition({required this.id,required this.name, required this.code,required this.lastUpdated});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['lastUpdated'] = this.lastUpdated;
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
  late String group;
  late String lastUpdated;
  late Score score;

  Matches({required this.id, required this.season, required this.utcDate, required this.status, required this.matchday,  required this.group, required this.lastUpdated, required this.score,});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    season = (json['season'] != null ? new Season.fromJson(json['season']) : null)!;
    utcDate = json['utcDate'];
    status = json['status'];
    matchday = json['matchday'];
    stage = json['stage'];
    group = json['group'];
    lastUpdated = json['lastUpdated'];
    score = (json['score'] != null ? new Score.fromJson(json['score']) : null)!;
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
   return data;
  }
}

class Season {
  late int id;
  late String startDate;
  late String endDate;
  late int currentMatchday;

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


  Score({required this.winner, required this.duration, });

  Score.fromJson(Map<String, dynamic> json) {
    winner = json['winner'];
    duration = json['duration'];
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['winner'] = this.winner;
    data['duration'] = this.duration;
    return data;
  }
}








