class ArtisansModel {
  int? artisanId;
  String? name;
  String? email;
  String? mobileNumber;
  String? address;
  String? city;
  String? lga;
  String? state;
  String? biography;
  bool? verified;
  double? avgRatinfg;
  List<Rating>? rating;

  ArtisansModel(
      {this.artisanId,
      this.name,
      this.email,
      this.mobileNumber,
      this.address,
      this.city,
      this.lga,
      this.state,
      this.biography,
      this.verified,
      this.avgRatinfg,
      this.rating});

  ArtisansModel.fromJson(Map<String, dynamic> json) {
    artisanId = json['artisan_id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    address = json['address'];
    city = json['city'];
    lga = json['lga'];
    state = json['state'];
    biography = json['biography'];
    verified = json['verified'];
    avgRatinfg = json['avg_ratinfg'];
    if (json['user_feedback'] != null) {
      rating = <Rating>[];
      json['user_feedback'].forEach((v) {
        rating!.add(Rating.fromJson(v));
      });
    }
  }
}

class Rating {
  int? id;
  String? review;
  String? user;
  dynamic rating;
  int? userId;
  int? artisanId;

  Rating(
      {this.id,
      this.review,
      this.rating,
      this.userId,
      this.artisanId,
      this.user});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    review = json['review'];
    user = json['user'];
    rating = json['rating'];
    userId = json['user_id'];
    artisanId = json['artisan_id'];
  }
}
