class Trips {
  List<Trip>? trips;

  Trips({this.trips});

  Trips.fromJson(Map<String, dynamic> json) {
    if (json['trips'] != null) {
      trips = <Trip>[];
      json['trips'].forEach((v) {
        trips!.add(new Trip.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trips != null) {
      data['trips'] = this.trips!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trip {
  String? from;
  String? fromIata;
  String? to;
  String? toIata;

  Trip({this.from, this.to});

  Trip.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    fromIata = json['fromIata'];
    to = json['to'];
    toIata = json['toIata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['fromIata'] = this.fromIata;
    data['to'] = this.to;
    data['toIata'] = this.toIata;

    return data;
  }
}
