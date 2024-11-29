class Doctor {
  final String name;
  final String specialty;
  final String location;
  final double rating;
  final int reviews;
  final String image;

  Doctor({
    required this.name,
    required this.specialty,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.image,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialty: json['specialty'],
      location: json['location'],
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      image: json['image'],
    );
  }
}
